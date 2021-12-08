import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/api_config/config.dart';
import 'package:kobantitar_mobile/controllers/promo_kobmart_controller.dart';

class PromoKobmart extends StatefulWidget {
  const PromoKobmart({Key? key}) : super(key: key);

  @override
  _PromoKobmartState createState() => _PromoKobmartState();
}

class _PromoKobmartState extends State<PromoKobmart> {
  final PromoKobmartController controller = Get.put(PromoKobmartController());

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
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 60,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  child: Row(
                    children: [
                      GestureDetector(
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
                              'Kobantitar Mart',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff0f0f0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Image.network(
                     baseURI+controller.imageUrl,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Center(
                            child: Text('Oops... something went wrong'));
                      },
                    ),
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
