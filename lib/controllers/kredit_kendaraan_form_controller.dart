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

class KreditBarangFormController extends GetxController {
  var tenorController = TextEditingController();
  var tglPembayaranController = TextEditingController();
  var dateController = TextEditingController();
  final userData = GetStorage();
  late String token;
  var isLoading = false.obs;
  var isLoading2 = false.obs;
  var isMounted = false.obs;
  dynamic argumentData = Get.arguments;
  List<TenorConfig>? tenors = <TenorConfig>[].obs;
  var detailKredit = <KreditKendaraanCalculation>[].obs;
  int approvalFileId = 0;

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
    super.onInit();
  }

  void getTenor() async {
    try {
      isLoading(true);
      final data = await Service.fetchKreditKendaraanConfiguration(token);
      if (data != null) {
        final tenor = data.data!.tenors;
        tenors = tenor;
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
        print(jsonEncode(data));
        detailKredit.add(data);
        isMounted(true);
      }
    } finally {
      isLoading2(false);
    }
  }

  static var client = http.Client();

  var selectedSelfieImagePath = "".obs;
  var selectedSelfieImageSize = "".obs;

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

  Future<http.StreamedResponse> uploadImage(
      String file, String uploadContext) async {
    var uploadType = uploadContext;
    var uri = Uri.parse("${config.BASE_URL}/upload");
    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath("file", file));
    request.headers.addAll({"Content-type": "multipart/form-data"});

    var response = await request.send();
    final respStr = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      print(response.statusCode);
      final json = jsonDecode(respStr.body);
      final fileId = json['data']['file_id'];

      approvalFileId = fileId;
      print(approvalFileId);
      return response;
    } else {
      return Future.error(response);
    }
  }

  void printData() {
    print(argumentData.id);
    print(tenorController.text);
    print(dateController.text);
    print(approvalFileId);
    print("nama atasan");
  }

  Future<String?> submitPengajuanKreditKendaraan() async {
    final response = await http.post(
      Uri.parse("${config.BASE_URL}/pengajuan/kreditkendaraan"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        "tenor_id": tenorController.text,
        "product_id": argumentData.id,
        "start_date": dateController.text,
        "aprroval_file_id": approvalFileId,
        "nama_atasan": "nama atasan"
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json["status"];
    } else {
      return Future.error(response);
    }
  }
}
