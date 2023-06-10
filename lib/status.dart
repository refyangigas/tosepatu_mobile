import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'API/service.dart';

class status extends StatefulWidget {
  const status({super.key});

  @override
  State<status> createState() => _statusState();
}

class _statusState extends State<status> {
  List<dynamic> statusList = [];
  Color _getStatusColor(String status) {
    if (status == 'Belum Selesai') {
      return Colors.red;
    } else if (status == 'Proses') {
      return Colors.blue;
    } else if (status == 'Selesai') {
      return Colors.green;
    } else {
      return Colors.amber;
    }
  }

  @override
  void initState() {
    super.initState();
    getStatusData();
  }

  Future<void> getStatusData() async {
    try {
      final data = await StatusApiService.getStatusApi();
      setState(() {
        statusList = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    child: Builder(
                      builder: (context) => IconButton(
                        icon: Icon(Icons.access_alarms_rounded),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'TOSEPATU',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('Shine Your Shoes',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          )),
                    ],
                  ),
                  Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.access_alarms_rounded),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  )
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: statusList.length,
                      itemBuilder: (context, index) {
                        var statusData = statusList[index];

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
                                    padding:
                                        EdgeInsets.only(left: 10, right: 2),
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
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: 25,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: _getStatusColor(
                                            statusData['status']),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          statusData['status'],
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
