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
    return ListView(
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
          height: 40,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Obx(() {
            if (controller.list.isNotEmpty) {
              return DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: true,
                  value: value,
                  onChanged: (value) => setState(() {
                    this.value = value.toString();
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
        SizedBox(height: 20.0),
        Text(
          "Nomor Rekening",
          style: TextStyle(
            fontSize: 12.0,
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          height: 40,
          child: TextField(
            style: TextStyle(
              fontSize: 12.0,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelText: 'Masukkan Nomor Rekening',
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "Cabang",
          style: TextStyle(
            fontSize: 12.0,
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          height: 40,
          child: TextField(
            style: TextStyle(
              fontSize: 12.0,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelText: 'Masukkan nama rekening',
            ),
          ),
        ),
        SizedBox(height: 30.0),
      ],
    );
  }
}
