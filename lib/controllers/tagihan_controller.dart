import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/controllers/pengajuan_controller.dart';
import 'package:kobantitar_mobile/models/tagihan.dart';

class TagihanController extends GetxController {
  var isLoaded = false.obs;
  final userData = GetStorage();
  String token = "";
  final searchQueryController = TextEditingController();
  final RxList<DataTagihan> _tagihanList = <DataTagihan>[].obs;
  get tagihanList => _tagihanList.value;
  set tagihanList(value) => _tagihanList.value = value;

  final RxList<DataTagihan> _filteredTagihanList = <DataTagihan>[].obs;
  get filteredTagihanList => _filteredTagihanList.value;
  set filteredTagihanList(value) => _filteredTagihanList.value = value;

  var currentFilter = FilterData().obs;

  @override
  void onInit() {
    super.onInit();
    token = userData.read("token");
    getTagihan();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<Null> getTagihan() async {
    final data = await Service.fetchTagihan(token);
    if (data != null) {
      tagihanList = data.data!;
      filter();
      isLoaded(true);
    }
  }

  void setFilter({String? q, String? jenisTagihan}) {
    currentFilter(
        currentFilter.value.copyWith(category: jenisTagihan, query: q));
    filter();
  }

  Future<Null> filter() async {
    var filterData = currentFilter.value;

    if (filterData.query != null && filterData.query!.isNotEmpty) {
      filteredTagihanList = tagihanList.where((DataTagihan tagihan) {
        return tagihan.caption!
            .toLowerCase()
            .contains(filterData.query!.toLowerCase());
      }).toList();
      return;
    }
    if (filterData.category != null && filterData.category!.isNotEmpty) {
      filteredTagihanList = tagihanList
          .where(
            (DataTagihan tagihan) =>
                tagihan.type!.endsWith(filterData.category!),
          )
          .toList();
      print(filteredTagihanList.length);

      return;
    }
    filteredTagihanList = tagihanList;
  }
}
