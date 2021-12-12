import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:kobantitar_mobile/controllers/pengajuan_logam_mulia_form_controller.dart';
import 'package:kobantitar_mobile/screens/components/gradient_button.dart';
import 'package:kobantitar_mobile/screens/components/image_picker.dart';
import 'package:kobantitar_mobile/screens/sukses_notifikasi_screens/pengajuan_sukses.dart';

class PengajuanTransaksiLogamMuliaForm extends StatefulWidget {
  const PengajuanTransaksiLogamMuliaForm({Key? key}) : super(key: key);

  @override
  _PengajuanTransaksiLogamMuliaFormState createState() =>
      _PengajuanTransaksiLogamMuliaFormState();
}

class _PengajuanTransaksiLogamMuliaFormState
    extends State<PengajuanTransaksiLogamMuliaForm> {
  final PengajuanLogamMuliaFormController controller =
      Get.put(PengajuanLogamMuliaFormController());

  late DateTime _selectedDate;
  Task task = Task();
  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  bool? checkBoxValue = false;
  bool simpanGambar1 = false;
  bool simpanGambar2 = false;
  bool gambar1tersimpan = false;
  bool gambar2tersimpan = false;

  bool _available = false;

  dynamic tenorValue;

  final currencyFormatter = NumberFormat('#,##0', 'ID');
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
                          'Pengajuan Transaksi Logam Mulia',
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
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    0.0, 5.0), // shadow direction: bottom
                              )
                            ],
                          ),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xfff0f0f0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/gold-ingots.png"),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "${controller.argumentData.caption} / ${controller.argumentData.weight} gram",
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                  Text(
                                    "RP ${currencyFormatter.format(controller.argumentData.amount)}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    "Ubah",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.0,
                                      color: Color(0xff9A3A3A),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(
                                      0.0, 5.0), // shadow direction: bottom
                                )
                              ],
                            ),
                            padding: EdgeInsets.all(16),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tenor",
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    height: 40,
                                    width: double.infinity,
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Obx(() {
                                      if (controller.isLoaded.value) {
                                        return DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField(
                                            isDense: true,
                                            hint: Text(
                                              "Masukkan Tenor",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        bottom: 10.0),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent))),
                                            validator: (value) => value == null
                                                ? 'Instansi tidak boleh kosong'
                                                : null,
                                            value: tenorValue,
                                            onChanged: (value) => setState(() {
                                              checkIsAvailable();
                                              controller.tenorController.text =
                                                  value.toString();
                                              tenorValue = value;
                                            }),
                                            items:
                                                controller.tenors!.map((item) {
                                              return DropdownMenuItem(
                                                  value: item.id,
                                                  child: Text(item.caption!,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12.0)));
                                            }).toList(),
                                          ),
                                        );
                                      } else {
                                        return Center(child: Text(""));
                                      }
                                    }),
                                  ),
                                  SizedBox(height: 10),
                                  Text("Pembayaran dimulai tanggal",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12.0)),
                                  SizedBox(height: 5),
                                  Container(
                                    width: double.infinity,
                                    height: 40,
                                    child: GestureDetector(
                                      onTap: () => _selectDate(context),
                                      child: AbsorbPointer(
                                        child: TextFormField(
                                          onChanged: (s) => checkIsAvailable(),
                                          style: TextStyle(fontSize: 12.0),
                                          controller: controller.dateController,
                                          decoration: InputDecoration(
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              labelText:
                                                  "Masukkan Tanggal Pembayaran",
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      10.0, 0, 10.0, 10.0),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              suffixIcon:
                                                  Icon(Icons.calendar_today)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text("Keperluan",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12.0)),
                                  SizedBox(height: 5),
                                  Container(
                                    width: double.infinity,
                                    height: 40,
                                    child: TextFormField(
                                      onChanged: (s) => checkIsAvailable(),
                                      style: TextStyle(fontSize: 12.0),
                                      controller:
                                          controller.keperluanController,
                                      decoration: InputDecoration(
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        labelText: "Masukkan Keperluan",
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                10.0, 0, 10.0, 10.0),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(() {
                        if (controller.detailKredit.isNotEmpty) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                        0.0, 5.0), // shadow direction: bottom
                                  )
                                ],
                              ),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Detail Angsuran",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      Text(
                                        "Pokok per Bulan",
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Rp. ${currencyFormatter.format(controller.detailKredit[0].data!.angsuranPokok)}",
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      Text(
                                        "Margin per Bulan",
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Rp. ${currencyFormatter.format(controller.detailKredit[0].data!.marginPerBulan)}",
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      Text(
                                        "Angsuran per Bulan",
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                      Spacer(),
                                      Text(
                                          "Rp. ${currencyFormatter.format(controller.detailKredit[0].data!.angsuranPerBulan)}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.0,
                                          )),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      Text(
                                        "Total Angsuran",
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Rp. ${currencyFormatter.format(controller.detailKredit[0].data!.totalAngsuran)}",
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Text("");
                        }
                      }),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    0.0, 5.0), // shadow direction: bottom
                              )
                            ],
                          ),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bukti Approval",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Obx(() {
                                Future.delayed(Duration.zero, () async {
                                  checkIsAvailable();
                                });
                                return KobantitarImagePicker(
                                    onChangeImage: () => controller.getSelfie(
                                        ImageSource.camera, "app1"),
                                    selectedImagePath: controller
                                        .selectedSelfieImagePath.value);
                              }),
                              Text(
                                "Nama Atasan",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                height: 65,
                                child: TextFormField(
                                  controller: controller.namaAtasanController,
                                  onChanged: (s) => checkIsAvailable(),
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                  decoration: InputDecoration(
                                    helperText: ' ',
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 0.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelText: 'Masukkan Nama Atasan',
                                  ),
                                  validator: (value) {
                                    if (value == "") {
                                      return 'Nama atasan tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Obx(() {
                        if (controller.isLoaded.value) {
                          if (controller.isDoubleApproval == true) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                          0.0, 5.0), // shadow direction: bottom
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Bukti Approval",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Obx(() {
                                      Future.delayed(Duration.zero, () async {
                                        checkIsAvailable();
                                      });
                                      return KobantitarImagePicker(
                                          onChangeImage: () =>
                                              controller.getSelfie(
                                                  ImageSource.camera, "app2"),
                                          selectedImagePath: controller
                                              .selectedSelfieImage2Path.value);
                                    }),
                                    Text(
                                      "Nama Atasan",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    TextFormField(
                                      controller:
                                          controller.namaAtasan2Controller,
                                      onChanged: (s) => checkIsAvailable(),
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                      decoration: InputDecoration(
                                        helperText: ' ',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 0.0),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        labelText: 'Masukkan Nama Atasan',
                                      ),
                                      validator: (value) {
                                        if (value == "") {
                                          return 'Nama atasan tidak boleh kosong';
                                        }
                                        return null;
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                          return SizedBox(height: 0, width: 0);
                        } else {
                          return SizedBox(height: 0, width: 0);
                        }
                      }),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Checkbox(
                                  value: checkBoxValue,
                                  onChanged: (value) {
                                    checkIsAvailable();
                                    setState(() {
                                      this.checkBoxValue = value;
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: 'Saya sudah menyetujui ',
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.black),
                                        children: <InlineSpan>[
                                          TextSpan(
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  controller.openLink(
                                                      controller.termsUrl);
                                                },
                                              text: 'Syarat & Ketentuan',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Color(0xffEE6A6A))),
                                          TextSpan(
                                              text:
                                                  ' pengajuan transaksi logam mulia',
                                              style: TextStyle(
                                                fontSize: 12,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      buildAjukanButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool checkIsAvailable() {
    bool hasil = (checkBoxValue == true) &&
        ((controller.isDoubleApproval && controller.checkDataDua()) ||
            controller.checkDataSatu());
    setState(() {
      _available = hasil;
    });
    return hasil;
  }

  Widget buildAjukanButton() {
    List<Color> gradientColors = !_available
        ? [(Colors.grey[300])!, (Colors.grey[300])!]
        : [Color(0xff851212), Color(0xffFF8A8A)];
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: GradientButton(
          text: "Ajukan",
          onTap: () {
            if (!checkIsAvailable()) {
              return;
            }
            Get.defaultDialog(
              title: "",
              content: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text("Please wait")
                ],
              ),
              barrierDismissible: false,
            );
            if (controller.isDoubleApproval == true) {
              controller.submitPengajuanLogamMulia2().then((value) {
                Get.offAll(() => PengajuanSukses());
              }).catchError((e) {
                print(e);
              });
            } else {
              controller.submitPengajuanLogamMulia().then((value) {
                Get.offAll(() => PengajuanSukses());
              }).catchError((e) {
                print(e);
              });
            }
          },
          gradientColors: gradientColors,
        ));
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2019, 8),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var date =
            "${picked.toLocal().year}-${picked.toLocal().month}-${picked.toLocal().day}";
        controller.dateController.text = date;
      });
  }
}

class Task {
  String? name;
  DateTime? date;

  Task({this.name, this.date});
}
