import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraController extends GetxController {
  static var BASE_URL = "https://backend.kobantitar.com/api";

  static var client = http.Client();

  var selectedSelfieImagePath = "".obs;
  var selectedSelfieImageSize = "".obs;
  var selectedKTPImagePath = "".obs;
  var selectedKTPImageSize = "".obs;

  void getSelfie(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);

      if (image != null) {
        selectedSelfieImagePath.value = image.path;
        selectedSelfieImageSize.value =
            ((File(selectedSelfieImagePath.value)).lengthSync() / 1024 / 1024)
                    .toStringAsFixed(2) +
                " Mb";
      } else {
        Get.snackbar("No Image Selected", "Please select an image");
      }
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  void getKTPImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);

      if (image != null) {
        selectedKTPImagePath.value = image.path;
        selectedKTPImageSize.value =
            ((File(selectedKTPImagePath.value)).lengthSync() / 1024 / 1024)
                    .toStringAsFixed(2) +
                " Mb";
      } else {
        Get.snackbar("No Image Selected", "Please select an image");
      }
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  Future<http.StreamedResponse> uploadImage(String file) async {
    try {
      var uri = Uri.parse("$BASE_URL/upload}");
      var request = http.MultipartRequest('POST', uri);
      request.files.add(await http.MultipartFile.fromPath("file", file));
      request.headers.addAll({"Content-type": "multipart/form-data"});

      var response = await request.send();
      final respStr = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return response;
      } else {
        return Future.error(response);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
