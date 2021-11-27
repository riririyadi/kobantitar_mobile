import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/controllers/signup_controller.dart';
import 'package:kobantitar_mobile/models/instansi.dart';

class DataPribadi extends StatefulWidget {
  const DataPribadi({Key? key}) : super(key: key);

  @override
  _DataPribadiState createState() => _DataPribadiState();
}

class _DataPribadiState extends State<DataPribadi> {
  final SignUpController controller = Get.put(SignUpController());

  String? value;
  String jkel = "PRIA";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.dataPribadiFormKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        children: [
          // Obx(() {
          //   if (controller.isLoaded.value) {
          //     return Text("${controller.instansi!.data[1].name}");
          //   } else {
          //     return Text("Hallo");
          //   }
          // }),
          Text(
            "Nama Lengkap",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 65,
            child: TextFormField(
              controller: controller.namaController,
              style: TextStyle(
                fontSize: 12.0,
              ),
              decoration: InputDecoration(
                helperText: ' ',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Masukkan nama lengkap',
              ),
              validator: (value) {
                if (value == "") {
                  return 'Nama tidak boleh kosong';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            "Jenis Kelamin",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          SizedBox(height: 5.0),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      jkel = "PRIA";
                      controller.jenisKelaminController.text = "PRIA";
                    });
                  },
                  child: Container(
                    height: 40,
                    decoration: jkel == "PRIA"
                        ? BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          )
                        : BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1.0, color: Colors.grey)),
                    child: Center(
                      child: Text(
                        "Pria",
                        style: TextStyle(
                          color: jkel == "PRIA" ? Colors.white : Colors.black,
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
                      jkel = "WANITA";
                      controller.jenisKelaminController.text = "WANITA";
                    });
                  },
                  child: Container(
                    height: 40,
                    decoration: jkel == "WANITA"
                        ? BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          )
                        : BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1.0, color: Colors.grey)),
                    child: Center(
                      child: Text(
                        "Wanita",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: jkel == "WANITA" ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Text(
            "NIK / No. KTP",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 65,
            child: TextFormField(
              controller: controller.nikController,
              style: TextStyle(
                fontSize: 12.0,
              ),
              decoration: InputDecoration(
                helperText: ' ',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Masukkan 16 digit NIK / No. KTP',
              ),
              validator: (value) {
                if (value == "") {
                  return 'NIK tidak boleh kosong';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            "Alamat Sesuai KTP",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 100,
            child: TextFormField(
              controller: controller.alamatController,
              style: TextStyle(
                fontSize: 12.0,
              ),
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                helperText: ' ',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Masukkan alamat sesuai KTP',
              ),
              validator: (value) {
                if (value == "") {
                  return 'Alamat tidak boleh kosong';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            "Instansi",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Obx(() {
              if (controller.list.isNotEmpty) {
                return DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
                    value: value,
                    validator: (value) =>
                        value == null ? 'Instansi tidak boleh kosong' : null,
                    onChanged: (value) => setState(() {
                      this.value = value.toString();
                      controller.instansiController.text =
                          (controller.list.indexOf(value) + 1).toString();
                    }),
                    items: controller.list.map((item) {
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
            "Jabatan / Bagian / Dept.",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 65,
            child: TextFormField(
              controller: controller.jabatanController,
              style: TextStyle(
                fontSize: 12.0,
              ),
              decoration: InputDecoration(
                helperText: ' ',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Masukkan nama jabatan / Bagian / Dept',
              ),
              validator: (value) {
                if (value == "") {
                  return 'Jabatan tidak boleh kosong';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            "NIP",
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 65,
            child: TextFormField(
              controller: controller.nipController,
              style: TextStyle(
                fontSize: 12.0,
              ),
              decoration: InputDecoration(
                helperText: ' ',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Masukkan Nomor Induk Pegawai',
              ),
              validator: (value) {
                if (value == "") {
                  return 'NIP tidak boleh kosong';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  // DropdownMenuItem buildMenuItem(String item) => DropdownMenuItem(
  //       value: item.toString(),
  //       child: Text(item.toString()),
  //     );
}
