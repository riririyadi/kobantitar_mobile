import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/logam_mulia_calculation.dart';
import 'package:kobantitar_mobile/models/logam_mulia_configuration.dart';
import 'package:kobantitar_mobile/api_config/config.dart' as config;
import 'package:kobantitar_mobile/screens/components/camera.dart';
import 'package:kobantitar_mobile/screens/components/webview.dart';
import 'package:url_launcher/url_launcher.dart';

class PengajuanLogamMuliaFormController extends GetxController {
  var tenorController = TextEditingController();

  var dateController = TextEditingController();
  var keperluanController = TextEditingController();
  final userData = GetStorage();
  late String token;
  var isLoading = false.obs;
  var isLoading2 = false.obs;
  var isMounted = false.obs;
  dynamic argumentData = Get.arguments;
  List<TenorLogamMulia>? tenors = <TenorLogamMulia>[].obs;
  var detailKredit = <LogamMuliaCalculation>[].obs;
  int? approvalFileId;
  int? approvalFileId2;
  var termsUrl = "";
  var isDoubleApproval = false;
  var namaAtasanController = TextEditingController();
  var namaAtasan2Controller = TextEditingController();

  @override
  void onInit() {
    token = userData.read("token");
    getTenor();
    super.onInit();
  }

  @override
  void onReady() {
    tenorController.addListener(() {
      getCalculation();
    });
    super.onReady();
  }

  @override
  void onClose() {
    tenorController.dispose();
    dateController.dispose();
    keperluanController.dispose();
    namaAtasanController.dispose();
    namaAtasan2Controller.dispose();
    super.onClose();
  }

  void getTenor() async {
    try {
      isLoading(true);
      final data = await Service.fetchPengajuanLogamMuliaConfig(token);
      if (data != null) {
        tenors = data.data!.tenors;
        isDoubleApproval = data.data!.isDoubleApproval!;
        termsUrl = data.data!.termsUrl;
      }
    } finally {
      isLoading(false);
    }
  }

  void getCalculation() async {
    try {
      isLoading2(true);
      detailKredit.clear();
      final data = await Service.fetchPengajuanLogamMuliaCalculation(
          token, argumentData.id, tenorController.text);
      if (data != null) {
        detailKredit.add(data);
      }
    } finally {
      isLoading2(false);
    }
  }

  static var client = http.Client();

  var selectedSelfieImagePath = "".obs;
  var selectedSelfieImageSize = "".obs;
  var selectedSelfieImage2Path = "".obs;
  var selectedSelfieImage2Size = "".obs;

  void getSelfie(ImageSource imageSource, String imageContext) async {
    try {
      final XFile? image = await Get.to(CameraApp(
          keterangan: "Foto ini akan digunakan untuk pengajuan Logam Mulia di Kobantitar"));

      if (image != null) {
        if (imageContext == "app1") {
          print(image.path);
          selectedSelfieImagePath.value = "LOADING";
          await uploadImage(image.path, imageContext);
          selectedSelfieImagePath.value = image.path;

          selectedSelfieImageSize.value =
              ((File(selectedSelfieImagePath.value)).lengthSync() / 1024 / 1024)
                      .toStringAsFixed(2) +
                  " Mb";
        } else {
          selectedSelfieImage2Path.value = "LOADING";
          await uploadImage(image.path, imageContext);

          selectedSelfieImage2Path.value = image.path;
          selectedSelfieImage2Size.value =
              ((File(selectedSelfieImagePath.value)).lengthSync() / 1024 / 1024)
                      .toStringAsFixed(2) +
                  " Mb";
        }
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

      if (uploadType == "app1") {
        approvalFileId = fileId;
      } else {
        approvalFileId2 = fileId;
      }
      return response;
    } else {
      Get.snackbar("Opps", "error");
      return Future.error(response);
    }
  }

  bool checkDataSatu() {
    bool isTenorEmpty = tenorController.text.isNotEmpty;
    bool isDateEmpty = dateController.text.isNotEmpty;
    bool isKeperluanEmpty = keperluanController.text.isNotEmpty;
    bool isNamaAtasanEmtpty = namaAtasanController.text.isNotEmpty;
    bool approvalFileIdEmpty =
        !(approvalFileId == null || approvalFileId == "LOADING");
    return isTenorEmpty &&
        isDateEmpty &&
        isKeperluanEmpty &&
        isNamaAtasanEmtpty &&
        approvalFileIdEmpty;
  }

  bool checkDataDua() {
    bool approvalFileId2Empty = !(approvalFileId2 == null);
    bool namaAtasan2Empty = namaAtasan2Controller.text.isNotEmpty;
    return checkDataSatu() && approvalFileId2Empty && namaAtasan2Empty;
  }

  Future<String?> submitPengajuanLogamMulia() async {
    final response = await http.post(
      Uri.parse("${config.baseURL}/pengajuan/logammulia"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        "tenor_id": tenorController.text,
        "amount_id": argumentData.id,
        "start_date": dateController.text,
        "keperluan": keperluanController.text,
        "approval": [
          {"file_id": approvalFileId, "nama_atasan": namaAtasanController.text}
        ]
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(response.statusCode);
      return json["status"];
    } else {
      print(response.statusCode);

      return null;
    }
  }

  Future<String?> submitPengajuanLogamMulia2() async {
    final response = await http.post(
      Uri.parse("${config.baseURL}/pengajuan/logammulia"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        "amount_id": argumentData.id,
        "tenor_id": tenorController.text,
        "start_date": dateController.text,
        "keperluan": keperluanController.text,
        "approval": [
          {"file_id": approvalFileId, "nama_atasan": namaAtasanController.text},
          {
            "file_id": approvalFileId2,
            "nama_atasan": namaAtasan2Controller.text
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(response.statusCode);
      return json["status"];
    } else {
      print(response.statusCode);
      return null;
    }
  }

  Future openLink(String uri) async {
    if (await canLaunch(uri)) {
      Get.to(() => KobantitarWebview(
          judul: "Pengajuan Transaksi Logam Mulia", url: uri));
    }
  }
}
