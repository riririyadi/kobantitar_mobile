import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:kobantitar_mobile/controllers/pengajuan_kredit_barang_lain_form_controller.dart';
import 'package:kobantitar_mobile/screens/sukses_notifikasi_screens/pengajuan_sukses.dart';

class PengajuanKreditBarangLainForm extends StatefulWidget {
  const PengajuanKreditBarangLainForm({Key? key}) : super(key: key);

  @override
  _PengajuanKreditBarangLainFormState createState() =>
      _PengajuanKreditBarangLainFormState();
}

class _PengajuanKreditBarangLainFormState
    extends State<PengajuanKreditBarangLainForm> {
  final PengajuanKreditBarangFormController controller =
      Get.put(PengajuanKreditBarangFormController());
  late DateTime _selectedDate;
  Task task = Task();
  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  bool? checkBoxValue = false;
  bool simpanGambar1 = false;
  bool simpanGambar2 = false;
  bool gambar1tersimpan = false;
  bool gambar2tersimpan = false;

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
                          'Pengajuan Kredit Barang',
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
                                        image: AssetImage("assets/device.png"),
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
                                    "${controller.argumentData[0]['jenis_barang']} - ${controller.argumentData[0]['tipe_barang']}",
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                  Text(
                                    "RP ${currencyFormatter.format(int.parse(controller.argumentData[0]['nilai_barang']))}",
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
                                      if (controller.isLoading.value) {
                                        return Center(child: Text(""));
                                      } else {
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
                                                ? 'Tenor tidak boleh kosong'
                                                : null,
                                            value: tenorValue,
                                            onChanged: (value) => setState(() {
                                              tenorValue = value;
                                              controller.tenorController.text =
                                                  value.toString();
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
                                                    BorderRadius.circular(10),
                                              ),
                                              suffixIcon:
                                                  Icon(Icons.calendar_today)),
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
                        // ignore: unnecessary_null_comparison
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
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Obx(
                                    () => controller.selectedSelfieImagePath
                                                .value ==
                                            ""
                                        ? GestureDetector(
                                            onTap: () {
                                              controller.getSelfie(
                                                  ImageSource.camera, "app1");
                                            },
                                            child: Container(
                                              height: 160,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[350],
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                        Icons
                                                            .camera_alt_outlined,
                                                        size: 50),
                                                    Text("Ambil Foto")
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                                Stack(children: [
                                                  Container(
                                                    height: 160,
                                                    width: double.infinity,
                                                    child: Image.file(
                                                      File(controller
                                                          .selectedSelfieImagePath
                                                          .value),
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ),
                                                  simpanGambar1
                                                      ? Container(
                                                          height: 160,
                                                          child: Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        )
                                                      : Container(),
                                                ]),
                                                SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          controller.getSelfie(
                                                              ImageSource
                                                                  .camera,
                                                              "app1");
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .grey[400],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                                "Ambil ulang",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Expanded(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .uploadImage(
                                                                  controller
                                                                      .selectedSelfieImagePath
                                                                      .value,
                                                                  "app1")
                                                              .then((value) =>
                                                                  Get.snackbar(
                                                                      "Success",
                                                                      "Image saved successfully"));
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xff851212),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                                "Simpan",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                  ),
                                ),
                              ),
                              Text(
                                "Nama Atasan",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              TextFormField(
                                controller: controller.namaAtasanController,
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
                              )
                            ],
                          ),
                        ),
                      ),
                      Obx(() {
                        if (controller.isLoading.value) {
                          return SizedBox(height: 0, width: 0);
                        } else {
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
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Obx(
                                          () => controller
                                                      .selectedSelfieImage2Path
                                                      .value ==
                                                  ""
                                              ? GestureDetector(
                                                  onTap: () {
                                                    controller.getSelfie(
                                                        ImageSource.camera,
                                                        "app2");
                                                  },
                                                  child: Container(
                                                    height: 160,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[350],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Center(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                              Icons
                                                                  .camera_alt_outlined,
                                                              size: 50),
                                                          Text("Ambil Foto")
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                      Stack(children: [
                                                        Container(
                                                          height: 160,
                                                          width:
                                                              double.infinity,
                                                          child: Image.file(
                                                            File(controller
                                                                .selectedSelfieImage2Path
                                                                .value),
                                                            fit:
                                                                BoxFit.fitWidth,
                                                          ),
                                                        ),
                                                        simpanGambar2
                                                            ? Container(
                                                                height: 160,
                                                                child: Center(
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              )
                                                            : Container(),
                                                      ]),
                                                      SizedBox(height: 10),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                controller.getSelfie(
                                                                    ImageSource
                                                                        .camera,
                                                                    "app2");
                                                              },
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                          .grey[
                                                                      400],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                      "Ambil ulang",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Expanded(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                controller
                                                                    .uploadImage(
                                                                        controller
                                                                            .selectedSelfieImagePath
                                                                            .value,
                                                                        "app2")
                                                                    .then((value) =>
                                                                        Get.snackbar(
                                                                            "Success",
                                                                            "Image saved successfully"));
                                                              },
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xff851212),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                      "Simpan",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ]),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Nama Atasan",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    TextFormField(
                                      controller:
                                          controller.namaAtasan2Controller,
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
                                          const TextSpan(
                                              text: 'Syarat & Ketentuan',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Color(0xffEE6A6A))),
                                          const TextSpan(
                                              text: ' pengajuan kredit barang',
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
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: () {
                            if (checkBoxValue == true) {
                              if (controller.isDoubleApproval == true) {
                                controller
                                    .sumbitPengajuanBarangLain2()
                                    .then((value) {
                                  print(value);
                                  Get.to(() => PengajuanSukses());
                                }).printError();
                              } else {
                                controller
                                    .sumbitPengajuanBarangLain()
                                    .then((value) {
                                  print(value);
                                  Get.to(() => PengajuanSukses());
                                }).printError();
                              }
                            }
                          },
                          child: Container(
                            height: 48.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xff851212),
                                    Color(0xffFF8A8A)
                                  ]),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 1.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(
                                      0.0, 4.0), // shadow direction: bottom
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
            ],
          ),
        ),
      ),
    );
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

  _bottomSheet(context, data) {
    String control = data;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext c) {
          return Container(
            color: Color(0xff757575),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              height: 180,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Ambil dari',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();

                                controller.getSelfie(ImageSource.gallery, data);
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xfff0f0f0),
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    child: Icon(Icons.image),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text("Gallery"),
                          ],
                        ),
                        SizedBox(
                          width: 50.0,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();

                                controller.getSelfie(ImageSource.camera, data);
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xfff0f0f0),
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    child: Icon(Icons.camera),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text("Kamera"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class Task {
  String? name;
  DateTime? date;

  Task({this.name, this.date});
}
