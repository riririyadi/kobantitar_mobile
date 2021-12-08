// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({Key? key}) : super(key: key);

//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   late CameraController cameraController;
//   late List cameras;
//   late int selectedCameraIndex;

//   @override
//   void initState() {
//     availableCameras().then((value) {
//       cameras = value;
//       if (cameras.length > 0) {
//         selectedCameraIndex = 0;
//         initCamera(cameras[selectedCameraIndex]);
//       }
//     }).catchError((e) {
//       print(e.code);
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }

//   Future initCamera(CameraDescription cameraDescription) async {
//     if (cameraController != null) {
//       await cameraController.dispose();
//     }
//     cameraController =
//         CameraController(cameraDescription, ResolutionPreset.high);

//     cameraController.addListener(() {
//       if (mounted) {
//         setState(() {});
//       }
//     });

//     if (cameraController.value.hasError) {
//       print("camera error");
//     }

//     try {
//       await cameraController.initialize();
//     } catch (e) {
//       print("kamera error $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
