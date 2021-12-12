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
import 'package:kobantitar_mobile/models/bank.dart';
import 'package:kobantitar_mobile/models/instansi.dart';
import 'package:kobantitar_mobile/models/me.dart';
import 'package:kobantitar_mobile/screens/sukses_notifikasi_screens/update_akun_sukses.dart';

class PengaturanAkunController extends GetxController {
  var isSettingLoaded = false.obs;
  var isMeLoaded = false.obs;
  var isInstansiLoaded = false.obs;
  var isBankLoaded = false.obs;
  var isDataBankLoaded = false.obs;
  var isDataInstansiLoaded = false.obs;
  var isKTPUploaded = false.obs;
  var isSelfieUploaded = false.obs;
  List<Instansi> instansis = [];
  Instansi dataInstansi = Instansi();
  Bank dataBank = Bank();
  List<Bank> banks = [];

  String token = "";
  final userData = GetStorage();

  var setting = AppSetting();
  var me = Me();

  var bank = "";
  var instansi = "";
  var namaController = TextEditingController();
  var jenisKelaminController = TextEditingController();
  var nikController = TextEditingController();
  var alamatController = TextEditingController();
  var instansiController = TextEditingController();
  var jabatanController = TextEditingController();
  var nipController = TextEditingController();
  var passwordLamaController = TextEditingController();
  var passwordBaruController = TextEditingController();
  var konfirmPasswordController = TextEditingController();
  var alasanPengunduranDiriController = TextEditingController();
  var bankController = TextEditingController();
  var nomorRekeningController = TextEditingController();
  var cabangController = TextEditingController();
  var emailController = TextEditingController();
  var noHpController = TextEditingController();

  var selfiePath = "";
  var idCardPath = "";
  int? ktpFileId;
  int? selfieFileId;

  @override
  void onInit() {
    token = userData.read("token");
    getInstansi();
    getBank();
    getMe();
    super.onInit();
    Future.delayed(const Duration(seconds: 4), () {
      dataBank = banks.firstWhere((element) => element.name == bank);
      dataInstansi =
          instansis.firstWhere((element) => element.name == instansi);

      if (dataInstansi != null) {
        instansiController.text = instansis[dataInstansi.id! - 1].id.toString();
        isDataInstansiLoaded(true);
      }
      if (dataBank != null) {
        bankController.text = banks[dataBank.id! - 1].id.toString();
        isDataBankLoaded(true);
      }
    });
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
    passwordLamaController.dispose();
    passwordBaruController.dispose();
    konfirmPasswordController.dispose();
    bankController.dispose();
    nomorRekeningController.dispose();
    cabangController.dispose();
    emailController.dispose();
    noHpController.dispose();
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

  void getMe() async {
    final data = await Service.fetchMe(token);
    if (data != null) {
      me = data;

      namaController.text = me.nama!;
      jenisKelaminController.text = me.jenisKelamin!;
      nikController.text = me.nik!;
      alamatController.text = me.alamat!;
      jabatanController.text = me.jabatan!;
      bank = me.bank!;
      instansi = me.instansi!;
      nipController.text = me.nip!;
      nomorRekeningController.text = me.nomorRekening!;
      cabangController.text = me.cabang!;
      emailController.text = me.email!;
      noHpController.text = me.noHp!;
      selfiePath = me.photoUrl;
      idCardPath = me.ktpUrl;

      isMeLoaded(true);
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
        isSelfieUploaded(false);
        uploadImage(selectedSelfieImagePath.value, "selfie");
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
        isKTPUploaded(false);
        uploadImage(selectedKTPImagePath.value, "ktp");
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
        isKTPUploaded(true);
      } else {
        selfieFileId = fileId;
        isSelfieUploaded(true);
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
      "bank_id": bankController.text,
      "nomor_rekening": nomorRekeningController.text,
      "cabang": cabangController.text,
      "email": emailController.text,
      "no_hp": noHpController.text,
      if (selfieFileId != null) "photo_file_id": selfieFileId,
      if (ktpFileId != null) "ktp_file_id": ktpFileId
    });

    final response = await http.put(
      Uri.parse("${config.baseURL}/account"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
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
