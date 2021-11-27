import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/controllers/home_controller.dart';
import 'package:kobantitar_mobile/screens/home_screens/home_page.dart';
import 'package:kobantitar_mobile/screens/kontak_screens/kontak_widget.dart';
import 'package:kobantitar_mobile/screens/pengajuan_screens/pengajuan_widget.dart';
import 'package:kobantitar_mobile/screens/tagihan_screens/tagihan_widget.dart';
import 'akun_screens/akun_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _screenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
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
                elevation: 5,
                color: Colors.black.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: Container(
                  height: 64,
                  decoration: const BoxDecoration(
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
    );
  }
}
