import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/api_config/config.dart' as config;
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kobantitar_mobile/models/bank.dart';
import 'package:kobantitar_mobile/models/instansi.dart';
import 'package:kobantitar_mobile/models/nomor_anggota.dart';
import 'package:kobantitar_mobile/screens/auth_screens/login_screen.dart';
import 'package:kobantitar_mobile/screens/components/camera.dart';
import 'package:kobantitar_mobile/screens/sukses_notifikasi_screens/pendaftaran_sukses.dart';
import 'package:kobantitar_mobile/api_services/service.dart';

enum SignUpImage { ktp, selfie }

class SignUpController extends GetxController {
  static var client = http.Client();
  List<Instansi> instansis = [];
  List<Bank> banks = [];

  var isBankLoaded = false.obs;
  var isInstansiLoaded = false.obs;

  final dataPribadiFormKey = GlobalKey<FormState>();
  final detailBankFormKey = GlobalKey<FormState>();
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

  int step = 0;

  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    jenisKelaminController.text = "PRIA";
    if (argumentData[1] == "LAMA") {
      print("LAMA");
      NomorAnggota nomorAnggota = argumentData[2];
      namaController.text = nomorAnggota.nama!;
    }
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
    final data = await Service.fetchInstansi();
    if (data != null) {
      instansis = data;
      isInstansiLoaded(true);
    }
  }

  void getBank() async {
    final data = await Service.fetchBank();
    if (data != null) {
      banks = data;
      isBankLoaded(true);
    }
  }

  Map<SignUpImage, String> selectedImagePaths =
      {SignUpImage.ktp: "", SignUpImage.selfie: ""}.obs;

  Map<SignUpImage, int> fileIds =
      {SignUpImage.ktp: 0, SignUpImage.selfie: 0}.obs;

  bool checkIsImageFilled() {
    bool flag = true;
    fileIds.forEach((key, value) {
      if (value == 0) {
        flag = false;
      }
    });
    return flag;
  }

  void getImage(SignUpImage imageContext) async {
    try {
      final image = await Get.to(CameraApp(
        cameraId: imageContext == SignUpImage.selfie ? 1 : 0,
      ));

      if (image != null) {
        selectedImagePaths[imageContext] = "LOADING";
        await uploadImage(image.path, imageContext);
        selectedImagePaths[imageContext] = image.path;
      } else {
        Get.snackbar("No Image Selected", "Please select an image");
      }
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  Future<http.StreamedResponse> uploadImage(
      String file, SignUpImage uploadContext) async {
    var uploadType = uploadContext;
    var uri = Uri.parse("${config.baseURL}/upload");
    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath("file", file));
    request.headers.addAll({"Content-type": "multipart/form-data"});

    var response = await request.send();
    final respStr = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      print(response.statusCode);
      final json = jsonDecode(respStr.body);
      final fileId = json['data']['file_id'];
      print(json);
      fileIds[uploadContext] = fileId;
      return response;
    } else {
      return Future.error(response);
    }
  }

  Future<String?> signUp() async {
    final response = await http.post(
      Uri.parse("${config.baseURL}/register"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
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
        "photo_file_id": fileIds[SignUpImage.selfie],
        "ktp_file_id": fileIds[SignUpImage.ktp]
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Get.off(() => PendaftaranSukses());
      return "Success";
    }
    if (response.statusCode == 422) {
      Get.offAll(() => LoginScreen());
      Get.snackbar(
          "Sign Up Failed", "Email Anda Sudah digunakan silahkan login");
    } else {
      print(response.body);
      print(response.statusCode);
      Get.snackbar("Sign Up Failed", "Invalid data");
      return null;
    }
  }
}
