import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/controllers/ambil%20_simpanan_sukarela_controller.dart';
import 'package:kobantitar_mobile/screens/sukses_notifikasi_screens/pengajuan_sukses.dart';

class AmbilSimpananSukarela extends StatefulWidget {
  const AmbilSimpananSukarela({Key? key}) : super(key: key);

  @override
  _AmbilSimpananSukarelaState createState() => _AmbilSimpananSukarelaState();
}

class _AmbilSimpananSukarelaState extends State<AmbilSimpananSukarela> {
  final AmbilSimpananSukarelaController controller =
      Get.put(AmbilSimpananSukarelaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                          'Ambil Simpanan Sukarela',
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
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    child: Image(
                                      image:
                                          AssetImage('assets/investment.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total Simpanan Sukarela"),
                                Text(
                                  "Rp 90.000.000",
                                  style: TextStyle(
                                    color: Color(0xff7C0A0A),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20.0),
                        decoration: BoxDecoration(
                          /** @change Background Image */
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/bg-penarikan-simpanan.png'),
                              fit: BoxFit.cover),
                          border: Border(
                            top: BorderSide(
                                color: Theme.of(context).dividerColor),
                            bottom: BorderSide(
                                color: Theme.of(context).dividerColor),
                          ),
                        ),
                        child: Form(
                          key: controller.nominalFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Nominal Pengambilan"),
                              TextFormField(
                                  controller: controller.nominalController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    prefixText: 'Rp ',
                                    border: UnderlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Nominal Pengajuan tidak boleh kosong';
                                    }
                                  }),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  Text('saldo sisa simpanan sukarela',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                      )),
                                  Spacer(),
                                  Text(
                                    'Rp 70.000.000',
                                    style: TextStyle(
                                      color: Color(0xff7C0A0A),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10.0,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    if (controller.nominalFormKey.currentState!.validate()) {
                      controller
                          .ajukanPengambilan(
                              int.parse(controller.nominalController.text))
                          .then((value) {
                        print(value);
                        Get.to(() => PengajuanSukses());
                      });
                    }
                  },
                  child: Container(
                    height: 48.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xff851212), Color(0xffFF8A8A)]),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 1.0,
                          spreadRadius: 0.0,
                          offset: Offset(0.0, 4.0), // shadow direction: bottom
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Ajukan",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
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
