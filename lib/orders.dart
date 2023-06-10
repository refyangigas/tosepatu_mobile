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

  @override
  void initState() {
    super.initState();
    _loadLayananList();
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
                        height: MediaQuery.of(context).size.height / 1.7,
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
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Nama',
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
