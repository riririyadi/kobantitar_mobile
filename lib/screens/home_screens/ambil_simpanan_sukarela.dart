import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kobantitar_mobile/controllers/ambil_simpanan_sukarela_controller.dart';
import 'package:kobantitar_mobile/screens/sukses_notifikasi_screens/pengajuan_sukses.dart';

class AmbilSimpananSukarela extends StatefulWidget {
  const AmbilSimpananSukarela({Key? key}) : super(key: key);

  @override
  _AmbilSimpananSukarelaState createState() => _AmbilSimpananSukarelaState();
}

class _AmbilSimpananSukarelaState extends State<AmbilSimpananSukarela> {
  final AmbilSimpananSukarelaController controller =
      Get.put(AmbilSimpananSukarelaController());
  final currencyFormatter = NumberFormat('#,##0', 'ID');
  late int saldoSisa;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      saldoSisa = controller.argumenData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffEE6A6A),
                Color(0xffC30707),
                Color(0xfff8f8f8),
                Color(0xfff8f8f8)
              ]),
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
                                  'Rp ${currencyFormatter.format(controller.argumenData)}',
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
                                  inputFormatters: [
                                    ThousandsSeparatorInputFormatter()
                                  ],
                                  controller: controller.nominalController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    prefixText: 'Rp ',
                                    border: UnderlineInputBorder(),
                                  ),
                                  onChanged: (e) {
                                    var nominalPengambilan =
                                        e.replaceAll('.', '');
                                    setState(() {
                                      if (nominalPengambilan == "") {
                                        nominalPengambilan = "0";
                                      }
                                      saldoSisa = controller.argumenData -
                                          int.parse(nominalPengambilan);
                                      if (nominalPengambilan == "") {
                                        saldoSisa = controller.argumenData;
                                      }
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Nominal Pengambilan tidak boleh kosong';
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
                                    'Rp ${currencyFormatter.format(saldoSisa)}',
                                    style: TextStyle(
                                      color: Color(0xff7C0A0A),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10.0,
                                    ),
                                  ),
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
                          .postAjukanPengambilan(int.parse(controller
                              .nominalController.text
                              .replaceAll(".", "")))
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

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = '.'; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1)
          newString = separator + newString;
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}
