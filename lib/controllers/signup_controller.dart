import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kobantitar_mobile/models/instansi.dart';
import 'package:kobantitar_mobile/screens/sukses_notifikasi_screens/pendaftaran_sukses.dart';
import 'package:kobantitar_mobile/ApiServices/service.dart';

class SignUpController extends GetxController {
  var ktpFileId = 0;
  var selfieFileId = 0;

  final list = [].obs;
  final bankList = [].obs;

  final dataPribadiFormKey = GlobalKey<FormState>();
  final dataBankFormKey = GlobalKey<FormState>();
  final detailAkunFormKey = GlobalKey<FormState>();

  var namaController = TextEditingController();
  var jenisKelaminController = TextEditingController();
  var nikController = TextEditingController();
  var alamatController = TextEditingController();
  var instansiController = TextEditingController();
  var jabatanController = TextEditingController();
  var nipController = TextEditingController();
  var bankController = TextEditingController();
  var noRekController = TextEditingController();
  var cabangController = TextEditingController();
  var emailController = TextEditingController();
  var noHPController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    // Future.delayed(Duration(seconds: 5), () async {
    //   if (argumentData != null) {
    //     Get.snackbar("Hello", argumentData['message']);
    //   }
    // });
    print(argumentData[1]);

    jenisKelaminController.text = "PRIA";
    getInstansi();
    getBank();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    namaController.dispose();
    jenisKelaminController.dispose();
    nikController.dispose();
    alamatController.dispose();
    instansiController.dispose();
    jabatanController.dispose();
    nipController.dispose();
    bankController.dispose();
    noRekController.dispose();
    cabangController.dispose();
    emailController.dispose();
    noHPController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void getInstansi() async {
    var instansis = await Service.fetchInstansi();
    if (instansis != null) {
      for (var i = 0; i < instansis.length; i++) {
        list.add(instansis[i].name);
      }
    }
  }

  void getBank() async {
    var banks = await Service.fetchBank();
    if (banks != null) {
      // isLoaded = true.obs;
      // instansi2.add(dataInstansi);
      for (var i = 0; i < banks.length; i++) {
        bankList.add(banks[i].name);
      }
      // print(bankList);
    }
  }

  void printFileId() {
    print(ktpFileId);
    print(selfieFileId);
  }

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

  Future<http.StreamedResponse> uploadImage(
      String file, String uploadContext) async {
    var uploadType = uploadContext;
    var uri = Uri.parse("${BASE_URL}/upload");
    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath("file", file));
    request.headers.addAll({"Content-type": "multipart/form-data"});

    var response = await request.send();
    final respStr = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      print(response.statusCode);
      final json = jsonDecode(respStr.body);
      final fileId = json['data']['file_id'];
      if (uploadType == "ktp") {
        ktpFileId = fileId;
      } else {
        selfieFileId = fileId;
      }
      // print(fileId);
      return response;
    } else {
      // print(response.statusCode);
      return Future.error(response);
    }
  }

  Future<String?> signUp() async {
    final response = await http.post(
      Uri.parse("${BASE_URL}/register"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "jenis_pendaftaran": argumentData[1],
        "nomor_anggota": argumentData[0],
        "nama": namaController.text,
        "jenis_kelamin": jenisKelaminController.text,
        "nik": nikController.text,
        "alamat": alamatController.text,
        "instansi_id": instansiController.text,
        "jabatan": jabatanController.text,
        "nip": nipController.text,
        "bank_id": bankController.text,
        "nomor_rekening": noRekController.text,
        "cabang": cabangController.text,
        "email": emailController.text,
        "no_hp": noHPController.text,
        "password": confirmPasswordController.text,
        "photo_file_id": selfieFileId,
        "ktp_file_id": ktpFileId
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json);
      Get.off(() => PendaftaranSukses());
      return "Okee";
    } else {
      Get.snackbar("Sign Up Failed", "Invalid data");
      return null;
    }
  }
}