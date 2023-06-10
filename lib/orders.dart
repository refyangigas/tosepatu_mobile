import 'package:flutter/material.dart';
import 'package:tosepatu_mobile/slider/slideorder.dart';
import 'package:tosepatu_mobile/slider/slider.dart';

import 'API/service.dart';

class ordersPage extends StatefulWidget {
  const ordersPage({Key? key}) : super(key: key);

  @override
  _ordersPageState createState() => _ordersPageState();
}

class _ordersPageState extends State<ordersPage> {
  List<dynamic> _layananList = [];
  String? _selectedLayanan;
  List<dynamic> _pengirimanList = [];
  String? _selectedPengiriman;
  List<dynamic> _penjemputanList = [];
  String? _selectedPenjemputan;
  @override
  void initState() {
    super.initState();
    _loadLayananList();
    _loadPengirimanList();
    _loadPenjemputanList();
  }

  Future<void> _loadPenjemputanList() async {
    try {
      final penjemputanList =
          await PenjemputanService.fetchPenjemputanList('URL_API_ANDA');
      setState(() {
        _penjemputanList = penjemputanList;
      });
    } catch (e) {
      print('Failed to load layanan list: $e');
    }
  }

  Future<void> _loadPengirimanList() async {
    try {
      final pengirimanList =
          await PengirimanService.fetchPengirimanList('URL_API_ANDA');
      setState(() {
        _pengirimanList = pengirimanList;
      });
    } catch (e) {
      print('Failed to load layanan list: $e');
    }
  }

  Future<void> _loadLayananList() async {
    try {
      final layananList = await LayananService.fetchLayananList('URL_API_ANDA');
      setState(() {
        _layananList = layananList;
      });
    } catch (e) {
      print('Failed to load layanan list: $e');
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
                        icon: Icon(Icons.shopping_cart),
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
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Shine Your Shoes',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  sliderorder(),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  labelText: 'Jenis Layanan',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                value: _selectedLayanan,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedLayanan = newValue;
                                  });
                                },
                                items: _layananList.map((item) {
                                  final layanan = item as Map<String, dynamic>;
                                  final layananId = layanan['id'].toString();
                                  final layananName =
                                      layanan['name'].toString();
                                  return DropdownMenuItem<String>(
                                    value: layananId,
                                    child: Text(layananName),
                                  );
                                }).toList(),
                              ),
                              SizedBox(height: 10),
                              DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  labelText: 'Jenis Pengiriman',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                value: _selectedPengiriman,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedPengiriman = newValue;
                                  });
                                },
                                items: _pengirimanList.map((item) {
                                  final pengiriman =
                                      item as Map<String, dynamic>;
                                  final pengirimanId =
                                      pengiriman['id'].toString();
                                  final pengirimanName =
                                      pengiriman['name'].toString();
                                  return DropdownMenuItem<String>(
                                    value: pengirimanId,
                                    child: Text(pengirimanName),
                                  );
                                }).toList(),
                              ),
                              SizedBox(height: 10),
                              DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  labelText: 'Jenis Penjemputan',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                value: _selectedPenjemputan,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedPenjemputan = newValue;
                                  });
                                },
                                items: _penjemputanList.map((item) {
                                  final penjemputan =
                                      item as Map<String, dynamic>;
                                  final penjemputanId =
                                      penjemputan['id'].toString();
                                  final penjemputanName =
                                      penjemputan['name'].toString();
                                  return DropdownMenuItem<String>(
                                    value: penjemputanId,
                                    child: Text(penjemputanName),
                                  );
                                }).toList(),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Jumlah',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Alamat',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Total Pembayaran',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Aksi yang akan dilakukan ketika tombol ditekan
                                },
                                icon: Icon(
                                  Icons.check,
                                ),
                                label: Text('Submit'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.amber,
                                  onPrimary: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
