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
      key: controller.dataBankFormKey,
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
              if (controller.bankList.isNotEmpty) {
                return DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
                    validator: (value) =>
                        value == null ? 'Bank tidak boleh kosong' : null,
                    isExpanded: true,
                    value: value,
                    onChanged: (value) => setState(() {
                      this.value = value.toString();
                      controller.bankController.text =
                          (controller.bankList.indexOf(value) + 1).toString();
                    }),
                    items: controller.bankList.map((item) {
                      return DropdownMenuItem(
                          value: item,
                          child: Text(item,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 12.0)));
                    }).toList(),
                  ),
                );
              } else {
                return Text("Hallo");
              }
            }),
          ),
          SizedBox(height: 5.0),
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
                helperText: ' ',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Masukkan nama rekening',
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
