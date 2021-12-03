// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/app_setting.dart';
import 'package:kobantitar_mobile/api_config/config.dart' as config;
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/models/instansi.dart';
import 'package:kobantitar_mobile/models/me.dart';
import 'package:kobantitar_mobile/screens/sukses_notifikasi_screens/pengajuan_sukses.dart';
import 'package:kobantitar_mobile/screens/sukses_notifikasi_screens/update_akun_sukses.dart';

class PengaturanAkunController extends GetxController {
  var isSettingLoading = false.obs;
  var isMeLoading = false.obs;
  var isInstansiLoading = false.obs;
  List<Instansi> instansis = [];

  String token = "";
  final userData = GetStorage();

  var setting = AppSetting();
  var me = Me();

  final mengundurkanDiriFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  final ubahPasswordFormKey = GlobalKey<FormState>();

  var namaController = TextEditingController();
  var jenisKelaminController = TextEditingController();
  var nik = "";
  var alamatController = TextEditingController();
  var instansiController = TextEditingController();
  var jabatanController = TextEditingController();
  var nipController = TextEditingController();
  var passwordLamaController = TextEditingController();
  var passwordBaruController = TextEditingController();
  var konfirmPasswordController = TextEditingController();
  var alasanPengunduranDiriController = TextEditingController();
  var namaBankController = TextEditingController();
  var nomorRekeningController = TextEditingController();
  var cabangController = TextEditingController();
  var emailController = TextEditingController();
  var noHpController = TextEditingController();

  var passwordController = TextEditingController();
  var selfiePath = "";
  var idCardPath = "";
  int? ktpFileId;
  int? selfieFileId;

  @override
  void onInit() {
    token = userData.read("token");
    getMe();
    getInstansi();
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

    alamatController.dispose();
    instansiController.dispose();
    jabatanController.dispose();
    nipController.dispose();
    passwordLamaController.dispose();
    passwordBaruController.dispose();
    konfirmPasswordController.dispose();
    alasanPengunduranDiriController.dispose();

    super.onClose();
  }

  void getInstansi() async {
    try {
      isInstansiLoading(true);
      var data = await Service.fetchInstansi();
      if (data != null) {
        instansis = data;
      }
    } finally {
      isInstansiLoading(false);
    }
  }

  void getMe() async {
    try {
      isMeLoading(true);
      final data = await Service.fetchMe(token);
      if (data != null) {
        me = data;

        namaController.text = me.nama!;
        jenisKelaminController.text = me.jenisKelamin!;
        nik = me.nik!;
        alamatController.text = me.alamat!;
        instansiController.text = me.instansi!;
        jabatanController.text = me.jabatan!;
        nipController.text = me.nip!;
        nomorRekeningController.text = me.nomorRekening!;
        cabangController.text = me.cabang!;
        emailController.text = me.email!;
        noHpController.text = me.noHp!;
        selfiePath = me.photoUrl;
        idCardPath = me.ktpUrl;
      }
    } finally {
      isMeLoading(false);
      // TODO
    }
  }

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
      if (uploadType == "ktp") {
        ktpFileId = fileId;
      } else {
        selfieFileId = fileId;
      }
      return response;
    } else {
      return Future.error(response);
    }
  }

  Future<String?> updateAkun() async {
    var body = jsonEncode(<String, dynamic>{
      "nama": namaController.text,
      "jenis_kelamin": jenisKelaminController.text,
      "alamat": alamatController.text,
      "instansi_id": instansiController.text,
      "jabatan": jabatanController.text,
      "nip": nipController.text,
      "bank_id": namaBankController.text,
      "nomor_rekening": nomorRekeningController.text,
      "cabang": cabangController.text,
      "email": emailController.text,
      "no_hp": noHpController.text,
      if (selfieFileId != null) "photo_file_id": selfieFileId,
      if (ktpFileId != null) "ktp_file_id": ktpFileId
    });
    print(body);
    final response = await http.put(
      Uri.parse("${config.baseURL}/account"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Get.off(() => UpdateAkunSukses());
      return "Success";
    } else {
      Get.snackbar("Update Failed", "Invalid data");
      return null;
    }
  }
}
