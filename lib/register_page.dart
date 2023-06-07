import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tosepatu_mobile/API/service.dart';
import 'package:tosepatu_mobile/login_page.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final AuthService _authService = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void _register() {
    String name = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    try {
      _authService.register(name, email, password);
      final snackBar = SnackBar(
        content: Text('Registrasi berhasil!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => login(),
        ),
      );
    } catch (error) {
      final snackBar = SnackBar(
        content: Text('Terjadi kesalahan: $error'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Color.fromARGB(255, 169, 169, 0),
        fontFamily: 'aileron',
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 169, 169, 0),
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFF1E6FF),
          iconColor: Color.fromARGB(255, 169, 169, 0),
          prefixIconColor: Color.fromARGB(255, 169, 169, 0),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Image.asset(
                                "assets/images/logo2.png",
                                width: 200,
                                height: 200,
                              ),
                            ),
                            Text(
                              'DAFTAR AKUN',
                              style: TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold),
                            ),
                            Text('Daftar Terlebih Dahulu yuk!',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal)),
                            const SizedBox(height: 10 * 5),
                          ],
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Expanded(
                              flex: 8,
                              child: Form(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: usernameController,
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: const Color.fromARGB(
                                          255, 169, 169, 0),
                                      decoration: const InputDecoration(
                                        hintText: "Your username",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Icon(Icons.person),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: TextFormField(
                                        controller: emailController,
                                        textInputAction: TextInputAction.done,
                                        cursorColor:
                                            Color.fromARGB(255, 174, 185, 54),
                                        decoration: const InputDecoration(
                                          hintText: "Your email",
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Icon(Icons.email_rounded),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 1.0),
                                      child: TextFormField(
                                        controller: passwordController,
                                        textInputAction: TextInputAction.done,
                                        obscureText: true,
                                        cursorColor:
                                            Color.fromARGB(255, 174, 185, 54),
                                        decoration: const InputDecoration(
                                          hintText: "Your password",
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Icon(Icons.lock),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 9.0),
                                    Hero(
                                      tag: "login_btn",
                                      child: ElevatedButton(
                                        onPressed: () {
                                          _register();
                                        },
                                        child: Text(
                                          "Register".toUpperCase(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Text(
                                          "Sudah punya akun ?",
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0)),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return login();
                                                },
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            "Sign In",
                                            style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
