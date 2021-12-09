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
import 'package:kobantitar_mobile/models/kredit_kendaraan_calculation.dart';
import 'package:kobantitar_mobile/models/kredit_kendaraan_configuration.dart';
import 'package:kobantitar_mobile/api_config/config.dart' as config;
import 'package:kobantitar_mobile/screens/components/camera.dart';
import 'package:kobantitar_mobile/screens/components/webview.dart';
import 'package:url_launcher/url_launcher.dart';

class KreditBarangFormController extends GetxController {
  var tenorController = TextEditingController();
  var tglPembayaranController = TextEditingController();
  var dateController = TextEditingController();
  var namaAtasanController = TextEditingController();
  var namaAtasan2Controller = TextEditingController();
  final userData = GetStorage();
  late String token;
  var isLoading = false.obs;
  var isLoading2 = false.obs;
  var isMounted = false.obs;
  var isDoubleApproval = false;
  dynamic argumentData = Get.arguments;
  List<TenorConfig>? tenors = <TenorConfig>[].obs;
  var detailKredit = <KreditKendaraanCalculation>[].obs;
  int? approvalFileId;
  int? approvalFileId2;
  var termsUrl = "";

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
    tglPembayaranController.dispose();
    dateController.dispose();
    namaAtasanController.dispose();
    namaAtasan2Controller.dispose();
    super.onClose();
  }

  void getTenor() async {
    try {
      isLoading(true);
      final data = await Service.fetchKreditKendaraanConfiguration(token);
      if (data != null) {
        final tenor = data.data!.tenors;
        tenors = tenor;
        isDoubleApproval = data.data!.isDoubleApproval!;
        termsUrl = data.data!.termsUrl!;
      }
    } finally {
      isLoading(false);
    }
  }

  void getCalculation() async {
    try {
      isLoading2(true);
      detailKredit.clear();
      final data = await Service.fetchKreditBarangCalculation(
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
          keterangan: "Foto ini akan digunakan untuk pengajuan Logam Mulia"));

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
      final json = jsonDecode(respStr.body);
      final fileId = json['data']['file_id'];

      if (uploadType == "app1") {
        approvalFileId = fileId;
      } else {
        approvalFileId2 = fileId;
      }

      return response;
    } else {
      return Future.error(response);
    }
  }

  Future<String?> submitPengajuanKreditKendaraan() async {
    final response = await http.post(
      Uri.parse("${config.baseURL}/pengajuan/kreditkendaraan"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        "tenor_id": tenorController.text,
        "product_id": argumentData.id,
        "start_date": dateController.text,
        "approval": [
          {"file_id": approvalFileId, "nama_atasan": namaAtasanController.text}
        ],
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json["status"];
    } else {
      return Future.error(response);
    }
  }

  Future<String?> submitPengajuanKreditKendaraan2() async {
    final response = await http.post(
      Uri.parse("${config.baseURL}/pengajuan/kreditkendaraan"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        "tenor_id": tenorController.text,
        "product_id": argumentData.id,
        "start_date": dateController.text,
        "approval": [
          {"file_id": approvalFileId, "nama_atasan": namaAtasanController.text},
          {
            "file_id": approvalFileId2,
            "nama_atasan": namaAtasan2Controller.text
          }
        ],
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json["status"];
    } else {
      return Future.error(response);
    }
  }

  Future openLink(String uri) async {
    if (await canLaunch(uri)) {
      Get.to(() =>
          KobantitarWebview(judul: "Pengajuan Kredit Kendaraan", url: uri));
    }
  }

  bool checkDataSatu() {
    bool isTenorEmpty = tenorController.text.isNotEmpty;
    bool isDateEmpty = dateController.text.isNotEmpty;
    bool isNamaAtasanEmtpty = namaAtasanController.text.isNotEmpty;
    bool approvalFileIdEmpty =
        !(approvalFileId == null || approvalFileId == "LOADING");
    return isTenorEmpty &&
        isDateEmpty &&
        isNamaAtasanEmtpty &&
        approvalFileIdEmpty;
  }

  bool checkDataDua() {
    bool approvalFileId2Empty = !(approvalFileId2 == null);
    bool namaAtasan2Empty = namaAtasan2Controller.text.isNotEmpty;
    return checkDataSatu() && approvalFileId2Empty && namaAtasan2Empty;
  }
}
