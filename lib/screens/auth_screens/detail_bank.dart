import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/controllers/signup_controller.dart';

class DetailBank extends StatefulWidget {
  const DetailBank({Key? key}) : super(key: key);

  @override
  _DetailBankState createState() => _DetailBankState();
}

class _DetailBankState extends State<DetailBank> {
  final SignUpController controller = Get.put(SignUpController());
  String? value;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.detailBankFormKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        children: [
          Text(
            "Pilih Bank",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 50,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Obx(() {
              if (controller.isBankLoading.value) {
                return Text("");
              } else {
                return DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
                    validator: (value) =>
                        value == null ? 'Bank tidak boleh kosong' : null,
                    isExpanded: true,
                    onChanged: (value) => setState(() {
                      this.value = value.toString();
                      controller.bankController.text = value.toString();
                    }),
                    items: controller.banks.map((item) {
                      return DropdownMenuItem(
                          value: item.id,
                          child: Text(item.name!,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 12.0)));
                    }).toList(),
                  ),
                );
              }
            }),
          ),
          SizedBox(height: 20.0),
          Text(
            "Nomor Rekening",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 65,
            child: TextFormField(
              style: TextStyle(
                fontSize: 12.0,
              ),
              controller: controller.noRekController,
              decoration: InputDecoration(
                helperText: ' ',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Masukkan Nomor Rekening',
              ),
              validator: (value) {
                if (value == "") {
                  return 'Nomor Rekening tidak boleh kosong';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            "Cabang",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 65,
            child: TextFormField(
              controller: controller.cabangController,
              style: TextStyle(
                fontSize: 12.0,
              ),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Masukkan nama cabang',
              ),
              validator: (value) {
                if (value == "") {
                  return 'Kantor Cabang tidak boleh kosong';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
