import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/screens/components/snackbar.dart';
import 'package:kobantitar_mobile/screens/home_screens/home_page.dart';
import 'package:kobantitar_mobile/screens/kontak_screens/kontak_widget.dart';
import 'package:kobantitar_mobile/screens/pengajuan_screens/pengajuan_widget.dart';
import 'package:kobantitar_mobile/screens/splash_screen.dart';
import 'package:kobantitar_mobile/screens/tagihan_screens/tagihan_widget.dart';
import '../main.dart';
import 'akun_screens/akun_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _screenIndex = 0;

  int _counter = 0;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null ) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      AndroidNotification android = message.notification!.android!;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        showNotification(notification);
      }
    });
  }

  void showNotification(RemoteNotification notification) {
    showSnackbar(notification.title!, notification.body!,
        titleText: Text(
          notification.title!,
          style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        messageText: Text(
          notification.body!,
          style: const TextStyle(color: Colors.white, fontSize: 10, height: 1.5),
        ),
        position: SnackPosition.TOP,
        background: Colors.green,
        icon: const Icon(Icons.email, color: Colors.white));

    // flutterLocalNotificationsPlugin.show(
    //   notification.id,
    //   "Testing $_counter",
    //   "How you doin ?",
    //   NotificationDetails(
    //     android: AndroidNotificationDetails(channel.id, channel.name,
    //         importance: Importance.high,
    //         color: Colors.blue,
    //         playSound: true,
    //         icon: '@mipmap/ic_launcher'),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return KobantitarScreen(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0,
                  .9,
                  .9,
                  1
                ],
                colors: [
                  Color(0xffEE6A6A),
                  Color(0xffC30707),
                  Colors.white,
                  Colors.white
                ]),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  bottom: 0,
                  top: 0,
                  right: 0,
                  child: IndexedStack(
                    index: _screenIndex,
                    children: [
                      HomeWidget(),
                      KontakWidget(),
                      PengajuanWidget(),
                      TagihanWidget(),
                      AkunWidget(),
                    ],
                  ),
                ),
                Positioned(
                  child: PhysicalModel(
                    // elevation: 5,
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    child: Container(
                      height: 64,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              offset: Offset(0, -6),
                              blurRadius: 5)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _screenIndex = 0;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.home,
                                      color: _screenIndex == 0
                                          ? Colors.red
                                          : Colors.grey[600]),
                                  Text(
                                    "Home",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.0,
                                        color: _screenIndex == 0
                                            ? Colors.red
                                            : Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _screenIndex = 1;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.forum_rounded,
                                      color: _screenIndex == 1
                                          ? Colors.red
                                          : Colors.grey[600]),
                                  Text(
                                    "Kontak",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.0,
                                        color: _screenIndex == 1
                                            ? Colors.red
                                            : Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _screenIndex = 2;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.summarize_rounded,
                                      color: _screenIndex == 2
                                          ? Colors.red
                                          : Colors.grey[600]),
                                  Text(
                                    "Pengajuan",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.0,
                                        color: _screenIndex == 2
                                            ? Colors.red
                                            : Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _screenIndex = 3;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.sticky_note_2_rounded,
                                      color: _screenIndex == 3
                                          ? Colors.red
                                          : Colors.grey[600]),
                                  Text(
                                    "Tagihan",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.0,
                                        color: _screenIndex == 3
                                            ? Colors.red
                                            : Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _screenIndex = 4;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.person,
                                      color: _screenIndex == 4
                                          ? Colors.red
                                          : Colors.grey[600]),
                                  Text(
                                    "Akun",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10.0,
                                      color: _screenIndex == 4
                                          ? Colors.red
                                          : Colors.grey[600],
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
                  left: 0,
                  right: 0,
                  bottom: 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
