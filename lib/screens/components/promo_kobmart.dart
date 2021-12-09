import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/api_config/config.dart';
import 'package:kobantitar_mobile/models/dashboard.dart';
import 'package:kobantitar_mobile/screens/helper.dart';
import 'package:kobantitar_mobile/screens/home_screens/promo_kobmart.dart';


class PromoKobmartWidget extends StatelessWidget {
  final List<PromoProduct> productList;
  final String promoUrl;
  const PromoKobmartWidget({
    required this.promoUrl,
    required this.productList,
    Key? key}) : super(key: key);

  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffFF3C3C),
              Color(0xffEDD715)
            ]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal : 20),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Promo Kobmart",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {// return;
                    Get.to(() => PromoKobmart(),
                        arguments: promoUrl);
                  },
                  child: Text(
                    'Lihat Semua',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          SizedBox(
            height: 150,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: promoProducts(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> promoProducts() {
    List<Widget> list = [];

    for (int i = 0; i < productList.length; i++) {
      final product = productList[i];
      list.add(Container(
        width: 100.0,
        height: 150.0,
        margin: EdgeInsets.only(left : i == 0 ? 20 : 4.0 , right: i == productList.length -1 ? 20 : 4.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network("${baseURI}${product.imageUrl}"),
              SizedBox(
                height: 12.0,
              ),
              Text(
                  "Rp ${KobantitarHelper.currencyFormatter.format(product.hargaPromo).toString()}",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )),
              Text(
                  "Rp ${KobantitarHelper.currencyFormatter.format(product.hargaAwal).toString()}",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 10,
                    decoration: TextDecoration.lineThrough,
                  )),
            ],
          ),
        ),
      )); //add any Widget in place of Text("Index $i")
    }
    return list; // all widget added now retrun the list here
  }

}
