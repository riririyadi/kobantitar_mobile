import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/main.dart';
import 'package:kobantitar_mobile/screens/components/kobantitar_app_bar.dart';

class CameraApp extends StatefulWidget {
  final String keterangan;
  const CameraApp({
    required this.keterangan,
    Key? key
  }) : super(key: key);
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  int currentCamera = 0;

  FlashMode currentFlashMode = FlashMode.off;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  void switchCamera(int cameraDescription) async {
    final previousCameraController = controller;
    final CameraController cameraController = CameraController(
      cameras[cameraDescription],
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    // Dispose the previous controller
    await previousCameraController?.dispose();
    // Replace with the new controller
    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    // Initialize controller
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    if (mounted) {
      setState(() {
        currentCamera = cameraDescription;
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();
      Get.back(result: "kocak");
      return file;
    } on CameraException catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Ambil Selfie", style: TextStyle(fontSize: 14.0)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xffED6B6B), Color(0xffF38585)])),
        ),
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              color: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      switchCamera(currentCamera == 0 ? 1 : 0);
                    },
                    icon: Icon(
                      Icons.switch_camera_rounded,
                      color: Colors.white,
                      size: 25.0,
                    ),
                  ),
                ],
              )),
          !controller.value.isInitialized
              ? cameraBlank(context)
              : buildCameraPreview(controller, context),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.black,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    takePicture().then((value) => null);
                  },
                  icon: Icon(
                    Icons.camera,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container cameraBlank(context) => Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
      );

  Widget buildCameraPreview(CameraController cameraController, context) {
    final double previewAspectRatio = 1;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned.fill(
            child: AspectRatio(
              aspectRatio: 1 / previewAspectRatio,
              child: ClipRect(
                child: Transform.scale(
                  scale:
                      cameraController.value.aspectRatio / previewAspectRatio,
                  child: Center(
                    child: CameraPreview(cameraController),
                  ),
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 60,
                padding: EdgeInsets.all(8),
                color: Colors.white54,
                child: Center(
                  child: Text(
                   widget.keterangan,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.redAccent[700],
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
