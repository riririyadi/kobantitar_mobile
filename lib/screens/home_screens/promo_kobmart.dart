import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/api_config/config.dart';
import 'package:kobantitar_mobile/controllers/promo_kobmart_controller.dart';
import 'package:photo_view/photo_view.dart';

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
      appBar: AppBar(
          centerTitle: false,
          title: Text("Promo Kobantitar Mart", style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
          flexibleSpace:  Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[Color(0xffED6B6B), Color(0xffF38585)])),
          )),
      body: CachedNetworkImage(
        imageUrl: controller.imageUrl,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
        errorWidget: (context, url, error) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.extension, size: 80, color: Colors.grey),
              SizedBox(height: 12.0),
              Text("Tidak ada flyer promo saat ini"),
            ],
          )
        ),
        imageBuilder: (context, imageProvider) => PhotoView(imageProvider: imageProvider),
      )
    );
  }
}
