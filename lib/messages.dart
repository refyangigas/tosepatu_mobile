import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tosepatu_mobile/API/service.dart';
import 'package:intl/intl.dart';

class messages extends StatefulWidget {
  const messages({Key? key});

  @override
  State<messages> createState() => _messagesState();
}

class _messagesState extends State<messages> {
  List<dynamic> statusList = [];
  final UploadService buktiService = UploadService();

  @override
  void initState() {
    super.initState();
    getPembayaranData();
  }

  Future<void> getPembayaranData() async {
    try {
      final data = await PembayaranApiService.getPembayaranApi();
      setState(() {
        statusList = data;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> uploadData(File bukti, int id) async {
    try {
      await buktiService.uploadBukti(id, bukti);
      print('File berhasil diunggah ke API');
      Fluttertoast.showToast(
        msg: 'File berhasil diunggah ke API',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } catch (e) {
      print('Terjadi kesalahan saat mengunggah file: $e');
      Fluttertoast.showToast(
        msg: 'Terjadi kesalahan saat mengunggah file',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.email_outlined),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'TOSEPATU',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Shine Your Shoes',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.email_outlined),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: statusList.length,
                itemBuilder: (context, index) {
                  var statusData = statusList[index];
                  var total = double.parse(statusData['total']);
                  var formatter = NumberFormat('#,###', 'en_US');
                  return SizedBox(
                      height: 85,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(9, 9),
                                blurRadius: 5,
                              ),
                            ],
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                padding: EdgeInsets.only(
                                    top: 20, left: 10, right: 2),
                                // Tambahkan kode untuk menampilkan gambar atau ikon jika diperlukan
                              ),
                              Expanded(
                                child: Text(statusData['nama_user']),
                                flex: 1,
                              ),
                              Expanded(
                                child: Text(statusData['nama_layanan']),
                                flex: 2,
                              ),
                              Expanded(
                                child: Text(statusData['jumlah']),
                                flex: 1,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Pembayaran'),
                                        content: SingleChildScrollView(
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxHeight: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  2,
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/images/pembayaran.jpg',
                                                  width: 500,
                                                  height: 300,
                                                ),
                                                SizedBox(height: 10),
                                                Text('Total Pembayaran:  Rp ' +
                                                    formatter
                                                        .format(total)
                                                        .replaceAll(',', '.') +
                                                    ''),
                                                SizedBox(height: 10),
                                                ElevatedButton.icon(
                                                  onPressed: () async {
                                                    final picker =
                                                        ImagePicker();
                                                    final pickedFile =
                                                        await picker.getImage(
                                                            source: ImageSource
                                                                .gallery);

                                                    if (pickedFile != null) {
                                                      uploadData(
                                                          File(pickedFile.path),
                                                          statusData['id']);
                                                    }
                                                  },
                                                  icon: Icon(Icons.upload),
                                                  label: Text('Uploud Bukti'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.amber,
                                  onPrimary: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.monetization_on),
                                    SizedBox(width: 10),
                                    Text('Pembayaran'),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
