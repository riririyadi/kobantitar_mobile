import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/pengajuan.dart';
import 'package:kobantitar_mobile/models/tagihan.dart';

class FilterData {
  String? query;
  String? category;

  FilterData({this.query, this.category});

  FilterData copyWith({
    String? query,
    String? category,
  }) {
    return new FilterData(
      query: query ?? this.query,
      category: category ?? this.category,
    );
  }
}

class PengajuanController extends GetxController {
  var isLoading = false.obs;
  final userData = GetStorage();
  String token = "";
  final RxList<DataPengajuan> _pengajuanList = <DataPengajuan>[].obs;
  get pengajuanList => _pengajuanList.value;
  set pengajuanList(value) => _pengajuanList.value = value;

  final RxList<DataPengajuan> _filteredPengajuanList = <DataPengajuan>[].obs;
  get filteredPengajuanList => _filteredPengajuanList.value;
  set filteredPengajuanList(value) => _filteredPengajuanList.value = value;

  var currentFilter = FilterData().obs;

  @override
  void onInit() {
    super.onInit();
    token = userData.read("token");
    getPengajuan();
  }

  Future<Null> getPengajuan() async {
    try {
      isLoading(true);
      final data = await Service.fetchPengajuan(token);
      if (data != null) {
        pengajuanList = data.data!;
        filter();
      }
    } finally {
      isLoading(false);
      return null;
    }
  }

  void setFilter({String? q, String? jenisPengajuan}) {
    currentFilter(
        currentFilter.value.copyWith(category: jenisPengajuan, query: q));
    filter();
  }

  Future<Null> filter() async {
    var filterData = currentFilter.value;

    if (filterData.query != null && filterData.query!.isNotEmpty) {
      filteredPengajuanList = pengajuanList.where((DataPengajuan pengajuan) {
        return pengajuan.caption!
            .toLowerCase()
            .contains(filterData.query!.toLowerCase());
      }).toList();
      return;
    }
    if (filterData.category != null && filterData.category!.isNotEmpty) {
      filteredPengajuanList = pengajuanList
          .where(
            (DataPengajuan pengajuan) =>
                pengajuan.type!.endsWith(filterData.category!),
          )
          .toList();
      print(filteredPengajuanList.length);

      return;
    }
    filteredPengajuanList = pengajuanList;
  }
}
