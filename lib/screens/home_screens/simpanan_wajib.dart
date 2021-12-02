import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/models/simpanan_wajib.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SimpananWajib extends StatefulWidget {
  const SimpananWajib({Key? key}) : super(key: key);

  @override
  _SimpananWajibState createState() => _SimpananWajibState();
}

class _SimpananWajibState extends State<SimpananWajib> {
  final userData = GetStorage();
  late String token;

  int currentPage = 1;
  late int totalPages;
  int totalSimpananWajib = 0;
  int numOfSimpananWajib = 0;
  List<DataSimpananWajib> simpananWajibs = [];
  final currencyFormatter = NumberFormat('#,##0', 'ID');

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> getSimpananSukarelaData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    }

    final Uri uri = Uri.parse(
        "https://backend.kobantitar.com/api/simpanan/wajib?page=$currentPage");

    final response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final list =
          dataSimpananWajibFromJson(jsonEncode(json['data']['list']['data']));
      if (isRefresh) {
        simpananWajibs = list;
      } else {
        simpananWajibs.addAll(list);
      }

      totalPages =
          (json['data']['list']['pagination']['object_count'] / 15).ceil();
      numOfSimpananWajib = json['data']['list']['pagination']['object_count'];
      totalSimpananWajib = json['data']['total'];

      currentPage++;
      setState(() {});

      return true;
    } else {
      return false;
    }
  }

  void refreshData() async {
    try {
      await getSimpananSukarelaData(isRefresh: true);
      setState(() {});
      refreshController.refreshCompleted();
    } catch (e) {
      refreshController.refreshFailed();
    }
  }

  void loadData() async {
    try {
      await getSimpananSukarelaData();

      if (simpananWajibs.length >= numOfSimpananWajib) {
        // stop gaada user di database .... sudah abis datanya
        refreshController.loadNoData();
      } else {
        setState(() {});
        refreshController.loadComplete();
      }
    } catch (e) {
      refreshController.loadFailed();
    }
  }

  @override
  void initState() {
    super.initState();
    token = userData.read('token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffEE6A6A), Color(0xffC30707)]),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 14.0,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Simpanan Wajib',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Total Simpanan Wajib',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 10.0),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rp  ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0),
                            ),
                            Text(
                              '${currencyFormatter.format(totalSimpananWajib)}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 160,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Theme.of(context).dividerColor),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Menampilkan ${simpananWajibs.length} dari $numOfSimpananWajib',
                              style: TextStyle(fontSize: 12.0),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.download,
                                  color: Colors.green,
                                  size: 12.0,
                                ),
                                Text(
                                  'DOWNLOAD',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        child: SmartRefresher(
                          controller: refreshController,
                          enablePullUp: true,
                          onRefresh: refreshData,
                          onLoading: loadData,
                          footer: CustomFooter(
                            height: 30,
                            builder: (context, mode) {
                              if (mode == LoadStatus.idle) {
                                return Center(child: Text("Pull up to load"));
                              } else if (mode == LoadStatus.loading) {
                                return Center(
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              } else if (mode == LoadStatus.failed) {
                                return Center(child: Text("Load Failed!"));
                              } else if (mode == LoadStatus.canLoading) {
                                return Center(
                                    child: Text("release to load more"));
                              } else {
                                return Center(child: Text("No more Data"));
                              }
                            },
                          ),
                          child: ListView.separated(
                            itemCount: simpananWajibs.length,
                            itemBuilder: (context, index) {
                              final simpananSukarela = simpananWajibs[index];
                              return Container(
                                padding: EdgeInsets.all(10.0),
                                child: Row(children: [
                                  Icon(Icons.verified_sharp,
                                      color: Colors.green),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${simpananSukarela.text}",
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "${simpananSukarela.date}",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  if (simpananSukarela.isPositive ?? true)
                                    Text(
                                      "+Rp${currencyFormatter.format(simpananSukarela.amount)}",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  else
                                    Text(
                                      "-Rp${currencyFormatter.format(simpananSukarela.amount!.abs())}",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                ]),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) => Divider(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
