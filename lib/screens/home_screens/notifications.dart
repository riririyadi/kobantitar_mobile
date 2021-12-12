import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/controllers/notifikasi_controller.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final controller = Get.put(NotifikasiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffEE6A6A), Color(0xffC30707), Color(0xfff8f8f8),Color(0xfff8f8f8)]),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 20,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
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
                          'Notifikasi',
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
                top: 60,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xfff8f8f8),
                    ),
                    child: Obx(() {
                      if (controller.isLoaded.value) {
                        return ListView.builder(
                            itemCount: controller.notifikasi.length,
                            itemBuilder: (context, index) {
                              final notifikasi = controller.notifikasi[index];
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 16.0, 16.0, 0),
                                child: GestureDetector(
                                  onLongPress: () {
                                    Get.defaultDialog(
                                      title: "Delete",
                                      titleStyle: TextStyle(fontSize: 16),
                                      content: Text("Delete this notifications",
                                          style: TextStyle(fontSize: 14)),
                                      cancel: GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Cancel",
                                              style: TextStyle(fontSize: 14)),
                                        ),
                                      ),
                                      confirm: GestureDetector(
                                        onTap: () {
                                          controller
                                              .deleteNotifikasi(notifikasi.id!)
                                              .then((value) {
                                            print(value);
                                          });
                                          Get.back();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Confirm",
                                              style: TextStyle(fontSize: 14)),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 5.0,
                                            spreadRadius: 1.0,
                                            offset: Offset(0.0,
                                                5.0), // shadow direction: bottom
                                          )
                                        ],
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Text("${notifikasi.title}"),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              /** @Change iconData, color & size  */
                                              Icon(Icons.access_time,
                                                  size: 12.0,
                                                  color: Colors.black45),
                                              /** @Change add padding  */
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 4.0)),
                                              /** @Change text color  */
                                              Text("${notifikasi.datetime}",
                                                  style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.black45))
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                              );
                            });
                      } else {
                        return Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
