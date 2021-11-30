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
import 'package:kobantitar_mobile/models/kredit_barang_calculation.dart';
import 'package:kobantitar_mobile/models/kredit_barang_configuration.dart';
import 'package:kobantitar_mobile/api_config/config.dart' as config;

class PengajuanKreditBarangFormController extends GetxController {
  var tenorController = TextEditingController();
  var tglPembayaranController = TextEditingController();
  var dateController = TextEditingController();
  var keperluanController = TextEditingController();
  final userData = GetStorage();
  late String token;
  var isLoading = false.obs;
  var isLoading2 = false.obs;
  var isMounted = false.obs;
  dynamic argumentData = Get.arguments;
  List<TenorBarang>? tenors = <TenorBarang>[].obs;
  var detailKredit = <BarangLainCalculation>[].obs;
  int approvalFileId = 0;

  @override
  void onInit() {
    print(argumentData);
    token = userData.read("token");
    getTenor();
    super.onInit();
  }

  @override
  void onReady() {
    tenorController.addListener(() {
      print(tenorController.text);
      getCalculation();
    });
    dateController.addListener(() {
      print(dateController.text);
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
      final data = await Service.fetchPengajuanBarangLainConfig(token);
      if (data != null) {
        // print(jsonEncode(data));

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
      final data = await Service.fetchPengajuanBarangCalculation(token,
          int.parse(argumentData[0]['nilai_barang']), tenorController.text);
      if (data != null) {
        // print(jsonEncode(data));

        detailKredit.add(data);
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
    print("tenor: " + tenorController.text);
    print("nominal: " + argumentData[0]['nilai_barang']);
    print("jenis_barang: " + argumentData[0]['jenis_barang']);
    print("tipe_barang: " + argumentData[0]['tipe_barang']);
    print("start_date: " + dateController.text);
    print("approval_file_id: " + approvalFileId.toString());
    print("nama_atasan: Pak Jajang");
  }

  Future<String?> sumbitPengajuanBarangLain() async {
    final response = await http.post(
      Uri.parse("${config.BASE_URL}/pengajuan/kreditbarang"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        "tenor_id": tenorController.text,
        "nominal": int.parse(argumentData[0]['nilai_barang']),
        "jenis_barang": argumentData[0]['jenis_barang'],
        "tipe_barang": argumentData[0]['tipe_barang'],
        "start_date": dateController.text,
        "aprroval_file_id": approvalFileId,
        "nama_atasan": "Pak jajang"
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
}
