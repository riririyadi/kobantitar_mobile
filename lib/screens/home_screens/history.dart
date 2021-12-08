import 'package:flutter/material.dart';
import 'dart:convert';

import "package:get/get.dart";
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:kobantitar_mobile/controllers/home_controller.dart';
import 'package:kobantitar_mobile/controllers/simpanan_sukarela_controller.dart';
import 'package:kobantitar_mobile/models/simpanan_sukarela.dart';
import 'package:kobantitar_mobile/screens/home_screens/ambil_simpanan_sukarela.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final userData = GetStorage();
  late String token;
  int _screen = 0;
  int currentPage = 1;
  late int totalPages;

  int numOfSimpananSukarela = 0;
  List<DataSimpananSukarela> simpananSukarelas = [];
  final currencyFormatter = NumberFormat('#,##0', 'ID');

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> getSimpananSukarelaData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    }

    final Uri uri = Uri.parse(
        "https://backend.kobantitar.com/api/simpanan/sukarela?page=$currentPage");

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
      final list = dataSimpananSukarelaFromJson(
          jsonEncode(json['data']['list']['data']));
      if (isRefresh) {
        simpananSukarelas = list;
      } else {
        simpananSukarelas.addAll(list);
      }

      totalPages =
          (json['data']['list']['pagination']['object_count'] / 15).ceil();
      numOfSimpananSukarela =
          json['data']['list']['pagination']['object_count'];

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

      if (simpananSukarelas.length >= numOfSimpananSukarela) {
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
    return Container(
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
                bottom: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Menampilkan ${simpananSukarelas.length} dari $numOfSimpananSukarela',
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
                    return Center(child: Text("release to load more"));
                  } else {
                    return Center(child: Text("No more Data"));
                  }
                },
              ),
              child: ListView.separated(
                itemCount: simpananSukarelas.length,
                itemBuilder: (context, index) {
                  final simpananSukarela = simpananSukarelas[index];
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(children: [
                      Icon(Icons.verified_sharp, color: Colors.green),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${simpananSukarela.text}",
                              maxLines: 2,
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
                            color: Colors.red,
                          ),
                        ),
                    ]),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
