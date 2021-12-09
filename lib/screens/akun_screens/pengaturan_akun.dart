import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kobantitar_mobile/controllers/akun_controller.dart';
import 'package:kobantitar_mobile/controllers/pengaturan_akun_controller.dart';
import 'package:kobantitar_mobile/models/bank.dart';
import 'package:kobantitar_mobile/models/instansi.dart';

class PengaturanAkun extends StatefulWidget {
  const PengaturanAkun({Key? key}) : super(key: key);

  @override
  _PengaturanAkunState createState() => _PengaturanAkunState();
}

class _PengaturanAkunState extends State<PengaturanAkun> {
  final PengaturanAkunController controller =
      Get.put(PengaturanAkunController());

  int instansiValue = 4;
  int bankValue = 5;

  @override
  void initState() {
    super.initState();
  }

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
                          'Pengaturan Akun',
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
                      Form(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                          0.0, 5.0), // shadow direction: bottom
                                    )
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Data Pribadi",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 20.0),
                                    Text(
                                      "Bergabung Sejak",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      "01 Januari 2005",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 20.0),
                                    Text(
                                      "Nama Lengkap",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(
                                      height: 40,
                                      child: TextFormField(
                                        controller: controller.namaController,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          labelText: 'Masukkan nama lengkap',
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    Text(
                                      "Jenis Kelamin",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Obx(() {
                                      if (controller.isMeLoaded.value) {
                                        return Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    controller
                                                        .jenisKelaminController
                                                        .text = "PRIA";
                                                  });
                                                },
                                                child: Container(
                                                  height: 40,
                                                  decoration: controller
                                                              .jenisKelaminController
                                                              .text ==
                                                          "PRIA"
                                                      ? BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        )
                                                      : BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              width: 1.0,
                                                              color:
                                                                  Colors.grey)),
                                                  child: Center(
                                                    child: Text(
                                                      "Pria",
                                                      style: TextStyle(
                                                        color: controller
                                                                    .jenisKelaminController
                                                                    .text ==
                                                                "PRIA"
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10.0),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    controller
                                                        .jenisKelaminController
                                                        .text = "WANITA";
                                                  });
                                                },
                                                child: Container(
                                                  height: 40,
                                                  decoration: controller
                                                              .jenisKelaminController
                                                              .text ==
                                                          "WANITA"
                                                      ? BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        )
                                                      : BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              width: 1.0,
                                                              color:
                                                                  Colors.grey)),
                                                  child: Center(
                                                    child: Text(
                                                      "Wanita",
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: controller
                                                                    .jenisKelaminController
                                                                    .text ==
                                                                "WANITA"
                                                            ? Colors.white
                                                            : Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );

                                        ///

                                      } else {
                                        return Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    controller
                                                        .jenisKelaminController
                                                        .text = "PRIA";
                                                  });
                                                },
                                                child: Container(
                                                  height: 40,
                                                  decoration: controller
                                                              .jenisKelaminController
                                                              .text ==
                                                          "PRIA"
                                                      ? BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        )
                                                      : BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              width: 1.0,
                                                              color:
                                                                  Colors.grey)),
                                                  child: Center(
                                                    child: Text(
                                                      "Pria",
                                                      style: TextStyle(
                                                        color: controller
                                                                    .jenisKelaminController
                                                                    .text ==
                                                                "PRIA"
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10.0),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    controller
                                                        .jenisKelaminController
                                                        .text = "WANITA";
                                                  });
                                                },
                                                child: Container(
                                                  height: 40,
                                                  decoration: controller
                                                              .jenisKelaminController
                                                              .text ==
                                                          "WANITA"
                                                      ? BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        )
                                                      : BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              width: 1.0,
                                                              color:
                                                                  Colors.grey)),
                                                  child: Center(
                                                    child: Text(
                                                      "Wanita",
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: controller
                                                                    .jenisKelaminController
                                                                    .text ==
                                                                "WANITA"
                                                            ? Colors.white
                                                            : Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }
                                    }),
                                    SizedBox(height: 20.0),
                                    Text(
                                      "NIK / No. KTP",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Obx(() {
                                      if (controller.isMeLoaded.value) {
                                        return Text(
                                          "${controller.nikController.text}",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w600),
                                        );
                                      } else {
                                        return Text("");
                                      }
                                    }),
                                    SizedBox(height: 20.0),
                                    Text(
                                      "Alamat Sesuai KTP",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(
                                      height: 80,
                                      child: TextFormField(
                                        controller: controller.alamatController,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                        maxLines: 5,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          labelText:
                                              'Masukkan Alamat Sesuai KTP',
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    Text(
                                      "Instansi",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(
                                      height: 50,
                                      width: double.infinity,
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 1.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Obx(() {
                                        if (controller
                                            .isDataInstansiLoaded.value) {
                                          return DropdownButtonHideUnderline(
                                            child: DropdownButtonFormField(
                                              isExpanded: true,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent))),
                                              validator: (value) => value ==
                                                      null
                                                  ? 'Instansi tidak boleh kosong'
                                                  : null,
                                              value: controller
                                                  .instansis[(controller
                                                          .dataInstansi.id! -
                                                      1)]
                                                  .id,
                                              onChanged: (value) =>
                                                  setState(() {
                                                controller.instansiController
                                                    .text = value.toString();
                                              }),
                                              items: controller.instansis
                                                  .map((item) {
                                                return DropdownMenuItem(
                                                    value: item.id,
                                                    child: Text(item.name!,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12.0)));
                                              }).toList(),
                                            ),
                                          );
                                        } else {
                                          return Text("");
                                        }
                                      }),
                                    ),
                                    SizedBox(height: 20.0),
                                    Text(
                                      "Jabatan / Bagian / Dept.",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(
                                      height: 40,
                                      child: TextFormField(
                                        controller:
                                            controller.jabatanController,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          labelText:
                                              'Masukkan 16 digit Jabatan / Bagian / Dept',
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    Text(
                                      "NIP",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(
                                      height: 40,
                                      child: TextFormField(
                                        controller: controller.nipController,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          labelText:
                                              'Masukkan Nomor Induk Pegawai',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                          0.0, 5.0), // shadow direction: bottom
                                    )
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Detail Bank",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 20.0),
                                    Text(
                                      "Nama Bank",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(
                                      height: 50,
                                      width: double.infinity,
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 1.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Obx(() {
                                        if (controller.isDataBankLoaded.value) {
                                          return DropdownButtonHideUnderline(
                                            child: DropdownButtonFormField(
                                              isExpanded: true,
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent))),
                                              validator: (value) => value ==
                                                      null
                                                  ? 'Bank tidak boleh kosong'
                                                  : null,
                                              value: controller
                                                  .banks[
                                                      controller.dataBank.id! -
                                                          1]
                                                  .id,
                                              onChanged: (value) =>
                                                  setState(() {
                                                controller.bankController.text =
                                                    value.toString();
                                              }),
                                              items:
                                                  controller.banks.map((item) {
                                                return DropdownMenuItem(
                                                    value: item.id,
                                                    child: Text(item.name!,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12.0)));
                                              }).toList(),
                                            ),
                                          );
                                        } else {
                                          return Text("");
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
                                      child: TextFormField(
                                        controller:
                                            controller.nomorRekeningController,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          labelText: 'Masukkan nomor rekening',
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
                                      child: TextFormField(
                                        controller: controller.cabangController,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          labelText:
                                              'Masukkan kantor cabang rekening anda',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                          0.0, 5.0), // shadow direction: bottom
                                    )
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Detail Akun",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 20.0),
                                    Text(
                                      "Alamat Email",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(
                                      height: 40,
                                      child: TextFormField(
                                        controller: controller.emailController,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          labelText: 'Masukkan alamat email',
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    Text(
                                      "No. Hp WhatsApp",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Container(
                                      height: 40,
                                      child: TextFormField(
                                        controller: controller.noHpController,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          labelText: 'Masukkan No. Hp WhatsApp',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                          0.0, 5.0), // shadow direction: bottom
                                    )
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dokumen",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 20.0),
                                    Text(
                                      "Foto Selfie",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Obx(() {
                                      if (controller.isMeLoaded.value) {
                                        return GestureDetector(
                                          onTap: () {},
                                          child: Obx(
                                            () => controller
                                                        .selectedSelfieImagePath
                                                        .value ==
                                                    ""
                                                ? GestureDetector(
                                                    onTap: () {
                                                      _bottomSheet(context, 1);
                                                    },
                                                    child: Container(
                                                      height: 160,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        color: Colors.grey,
                                                      ),
                                                      child: Image.network(
                                                        'https://backend.kobantitar.com${controller.selfiePath}',
                                                        fit: BoxFit.fitWidth,
                                                        errorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Object
                                                                    exception,
                                                                StackTrace?
                                                                    stackTrace) {
                                                          return Center(
                                                              child: Text(
                                                                  'Oops... something went wrong'));
                                                        },
                                                      ),
                                                    ),
                                                  )
                                                : Column(children: [
                                                    Container(
                                                      height: 160,
                                                      width: double.infinity,
                                                      child: Image.file(
                                                          File(controller
                                                              .selectedSelfieImagePath
                                                              .value),
                                                          fit: BoxFit.fitWidth),
                                                    ),
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
                                                              _bottomSheet(
                                                                  context, 2);
                                                            },
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
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
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                  .uploadImage(
                                                                      controller
                                                                          .selectedKTPImagePath
                                                                          .value,
                                                                      "ktp")
                                                                  .then((value) =>
                                                                      Get.snackbar(
                                                                          "Success",
                                                                          "Image saved successfully"));
                                                            },
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
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
                                        );
                                      } else {
                                        return Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        );
                                      }
                                    }),
                                    SizedBox(height: 20.0),
                                    Text(
                                      "Foto ID Card",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Obx(() {
                                      if (controller.isMeLoaded.value) {
                                        return GestureDetector(
                                          onTap: () {},
                                          child: Obx(
                                            () => controller
                                                        .selectedKTPImagePath
                                                        .value ==
                                                    ""
                                                ? GestureDetector(
                                                    onTap: () {
                                                      _bottomSheet(context, 2);
                                                    },
                                                    child: Container(
                                                      height: 160,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        color: Colors.grey,
                                                      ),
                                                      child: Image.network(
                                                        'https://backend.kobantitar.com${controller.idCardPath}',
                                                        fit: BoxFit.fitWidth,
                                                        errorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Object
                                                                    exception,
                                                                StackTrace?
                                                                    stackTrace) {
                                                          return Center(
                                                              child: Text(
                                                                  'Oops... something went wrong'));
                                                        },
                                                      ),
                                                    ),
                                                  )
                                                : Column(children: [
                                                    Container(
                                                      height: 160,
                                                      width: double.infinity,
                                                      child: Image.file(
                                                          File(controller
                                                              .selectedKTPImagePath
                                                              .value),
                                                          fit: BoxFit.fitWidth),
                                                    ),
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
                                                              _bottomSheet(
                                                                  context, 2);
                                                            },
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
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
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                  .uploadImage(
                                                                      controller
                                                                          .selectedKTPImagePath
                                                                          .value,
                                                                      "ktp")
                                                                  .then((value) =>
                                                                      Get.snackbar(
                                                                          "Success",
                                                                          "Image saved successfully"));
                                                            },
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
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
                                        );
                                      } else {
                                        return Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        );
                                      }
                                    }),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: () {
                            controller
                                .updateAkun()
                                .then((value) => print(value))
                                .catchError((e) => print(e));
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
                                "Simpan",
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

  _bottomSheet(context, data) {
    int control = data;
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
                                if (control == 1) {
                                  controller.getSelfie(ImageSource.gallery);
                                } else {
                                  controller.getKTPImage(ImageSource.gallery);
                                }
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
                                if (control == 1) {
                                  controller.getSelfie(ImageSource.camera);
                                } else {
                                  controller.getKTPImage(ImageSource.camera);
                                }
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
