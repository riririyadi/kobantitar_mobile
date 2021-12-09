import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kobantitar_mobile/controllers/signup_controller.dart';

class DetailAkun extends StatefulWidget {
  const DetailAkun({Key? key}) : super(key: key);

  @override
  _DetailAkunState createState() => _DetailAkunState();
}

class _DetailAkunState extends State<DetailAkun> {
  final SignUpController controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.detailAkunFormKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        children: [
          Text(
            "Alamat Email",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 65,
            child: TextFormField(
              controller: controller.emailController,
              style: TextStyle(
                fontSize: 12.0,
              ),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  helperText: ' ',
                  contentPadding: EdgeInsets.all(10.0),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: "Masukkan Alamat Email"),
              validator: (value) {
                if (value == "") {
                  return 'Email tidak boleh kosong';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            "No. HP (Whatsapp)",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 65,
            child: TextFormField(
              controller: controller.noHPController,
              style: TextStyle(
                fontSize: 12.0,
              ),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                helperText: ' ',
                contentPadding: EdgeInsets.all(10.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Masukkan Nomor HP yang terkait dengan WA',
              ),
              validator: (value) {
                if (value == "") {
                  return 'No HP Rekening tidak boleh kosong';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            "Password",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 65,
            child: TextFormField(
              controller: controller.passwordController,
              obscureText: true,
              style: TextStyle(
                fontSize: 12.0,
              ),
              decoration: InputDecoration(
                helperText: ' ',
                contentPadding: EdgeInsets.all(10.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Masukkan password',
              ),
              validator: (value) {
                if (value == "") {
                  return 'Password tidak boleh kosong';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            "Konfirmasi Password",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 65,
            child: TextFormField(
              obscureText: true,
              controller: controller.confirmPasswordController,
              style: TextStyle(
                fontSize: 12.0,
              ),
              decoration: InputDecoration(
                helperText: ' ',
                contentPadding: EdgeInsets.all(10.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Masukkan konfirmasi password',
              ),
              validator: (value) {
                if (value != controller.passwordController.text) {
                  return 'Konfirmasi password harus cocok';
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
