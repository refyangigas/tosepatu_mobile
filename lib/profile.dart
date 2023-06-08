import 'package:flutter/material.dart';
import 'package:tosepatu_mobile/API/service.dart';
import 'package:tosepatu_mobile/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {
  const profile({Key? key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final ProfileService _profileService = ProfileService();
  Map<String, dynamic>? _userProfile;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  void saveUserProfile() {
    final String name = nameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;

    try {
      _profileService.updateUserProfile(
        name: name,
        email: email,
        password: password,
      );
      // Tindakan yang sesuai setelah berhasil menyimpan data
      showSuccessSnackbar('Profil berhasil diperbarui');
    } catch (e) {
      print('Error: $e');
      // Tindakan yang sesuai jika gagal menyimpan data
      showErrorSnackbar('Gagal menyimpan profil');
    }
  }

  void showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> fetchUserProfile() async {
    try {
      final userProfile = await _profileService.fetchUserProfile();
      setState(() {
        _userProfile = userProfile;
      });
    } catch (e) {
      print('Error: $e');
      // Tindakan yang sesuai jika gagal mengambil profil pengguna
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () async {
              // Hapus shared preferences di sini
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear();

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => login()),
              );
            },
            icon: const Icon(
              Icons.logout,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: 110.0,
              ),
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 0, 0, 0),
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        NetworkImage("https://i.ibb.co/PGv8ZzG/me.jpg"),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello ${_userProfile?['name'] ?? ''}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                          ),
                        ),
                        Text(
                          _userProfile?['email'] ?? '',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 16.0,
                      backgroundColor: Colors.blueGrey[900],
                      child: const Icon(
                        Icons.edit,
                        size: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Builder(
                builder: (context) {
                  List<Map<String, dynamic>> items = [
                    {
                      "label": "Akun",
                      "icon": Icons.person_2_rounded,
                      "on_tap": () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Edit Profil'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    controller:
                                        nameController, // Gunakan controller untuk field nama
                                    decoration: const InputDecoration(
                                      labelText: 'Nama',
                                      hintText: 'Masukkan nama',
                                    ),
                                  ),
                                  TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      hintText: 'Masukkan email',
                                    ),
                                  ),
                                  TextFormField(
                                    controller:
                                        passwordController, // Gunakan controller untuk field password
                                    decoration: const InputDecoration(
                                      labelText: 'Password',
                                    ),
                                    obscureText: true,
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('Simpan'),
                                  onPressed: () {
                                    saveUserProfile();
                                    Navigator.of(context)
                                        .pop(); // Tutup dialog setelah menyimpan
                                  },
                                ),
                                ElevatedButton(
                                  child: const Text('Batal'),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Tutup dialog tanpa menyimpan
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    },
                    {
                      "label": "Tentang kami",
                      "icon": Icons.code,
                      "on_tap": () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Tentang Kami'),
                              content: const Text(
                                  'TOSEPATU adalah Jasa layanan cuci sepatu yang menawarkan pick up and delivery free ongkir khusus daerah sekitar kampus POLIJE jember ,didirikan oleh sekumpulan mahasiswa berawal hanya dari rencana dan kemudian diimplementasikan menjadi sebuah bisnis yang menguntungkan, TOSEPATU didasari oleh keinginan untuk menambah pengalaman,pemasukan kami sebagai mahasiswa.ketika awal beridiri, TOSEPATU kian mendapat banyak perhatian mulai dari kalangan mahasiswa,pekerja,dan kalangan lainnya.'),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('Tutup'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    },
                  ];

                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 12.0,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: items.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var item = items[index];
                          return InkWell(
                            onTap: () {
                              if (item["on_tap"] != null) {
                                item["on_tap"]!();
                              }
                            },
                            child: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: ListTile(
                                  leading: Icon(
                                    item["icon"],
                                    size: 30.0,
                                  ),
                                  title: Text(item["label"] as String),
                                  trailing: const Icon(
                                    Icons.chevron_right,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
