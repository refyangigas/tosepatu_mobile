import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tosepatu_mobile/API/service.dart';
import 'package:tosepatu_mobile/bottomnav.dart';
import 'package:tosepatu_mobile/register_page.dart';

import 'dashboard.dart';
// import 'package:tosepatu_mobile/r.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _handleLogin() async {
    String emailOrUsername = emailController.text;
    String password = passwordController.text;
    AuthService authService = AuthService();
    try {
      await authService.login(emailOrUsername, password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => bottomnav(currentTab: 2),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.close,
                color: Colors.white,
                size: 40,
              ),
              Text(
                e.toString(),
                style: TextStyle(fontSize: 8),
              ),
            ],
          ),
          duration: Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.red, width: 2.0),
          ),
          backgroundColor: Colors.red,
          elevation: 5.0,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          action: SnackBarAction(
            label: 'Dismiss',
            textColor: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
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
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 29,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Sign In to continue.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              )),
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
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    cursorColor:
                                        const Color.fromARGB(255, 169, 169, 0),
                                    onSaved: (email) {},
                                    decoration: const InputDecoration(
                                      hintText: "Your email",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Icon(Icons.email_rounded),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: TextFormField(
                                      controller: passwordController,
                                      textInputAction: TextInputAction.done,
                                      obscureText: true,
                                      cursorColor: Colors.amber,
                                      decoration: const InputDecoration(
                                        hintText: "Your password",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(12.0),
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
                                        _handleLogin();
                                      },
                                      child: Text(
                                        "Login".toUpperCase(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Text(
                                        "Belum punya akun ? ",
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
                                                return register();
                                              },
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          "Sign Up",
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
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
            ],
          ),
        ),
      ),
    );
  }
}
