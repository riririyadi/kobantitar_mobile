import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/controllers/informasi_controller.dart';

class Informasi extends StatefulWidget {
  const Informasi({Key? key}) : super(key: key);

  @override
  _InformasiState createState() => _InformasiState();
}

class _InformasiState extends State<Informasi> {
  final InformasiController controller = Get.put(InformasiController());
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
                          'Informasi',
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
                    if (controller.isInformasiLoaded.value) {
                      return ListView.builder(
                          padding: EdgeInsets.only(top: 10, bottom: 20),
                          itemCount: controller.informasi.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            final informasi = controller.informasi.data![index];
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.openLink(informasi.url!);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                        "https://backend.kobantitar.com${informasi.backgroundUrl}",
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return Container(
                          child: Center(child: CircularProgressIndicator()));
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
