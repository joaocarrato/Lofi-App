import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lofi_app/register%20page/register_page.dart';
import 'package:lofi_app/util/field_camps.dart';
import 'package:lofi_app/util/get_started_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerEmail = TextEditingController();

  final TextEditingController _controllerPassword = TextEditingController();

  // login method
  Future loginMethod() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _controllerEmail.text.trim(),
        password: _controllerPassword.text.trim());
  }

  // Navigate into register page
  void navigateRegister() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const RegisterPage(),
      ),
    );
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/lofi_wallpaper3.png'),
                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      '    Take your time, \nwhen you feel ready',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Image.asset(
                      'assets/images/lofi.png',
                      height: 150,
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 35,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // CAMPO DE EMAIL E PASSWORD

                    FieldCamps(
                      text: ' Email',
                      isObscure: false,
                      controller: _controllerEmail,
                    ),

                    FieldCamps(
                      text: ' Password',
                      isObscure: true,
                      controller: _controllerPassword,
                    ),

                    const SizedBox(height: 30),

                    GetStartedButton(
                      onTap: loginMethod,
                      text: 'Login',
                    ),

                    const SizedBox(height: 40),

                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.black45,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'or',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    GetStartedButton(
                      onTap: navigateRegister,
                      text: 'Register',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
