// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lofi_app/pages/is_logged.dart';
import 'package:lofi_app/util/field_camps.dart';
import 'package:lofi_app/util/get_started_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _controllerEmailRegister =
      TextEditingController();

  final TextEditingController _controllerPasswordRegister =
      TextEditingController();

  final TextEditingController _controllerPasswordRegisterConfirm =
      TextEditingController();

  Future register() async {
    if (isEqual()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _controllerEmailRegister.text.trim(),
        password: _controllerPasswordRegister.text.trim(),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const IsLogged()),
      );
    }
  }

  bool isEqual() {
    if (_controllerPasswordRegister.text.trim() ==
            _controllerPasswordRegisterConfirm.text.trim() &&
        _controllerEmailRegister.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool stringConf = true;

  void stringChange() {
    setState(() {
      if (isEqual()) {
        stringConf = true;
      } else {
        stringConf = false;
      }
    });
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
                image: AssetImage('assets/images/lofi_wallpaper2.png'),
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
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const IsLogged(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/lofi_icon1.png'),
                      radius: 80,
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Register',
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
                      controller: _controllerEmailRegister,
                    ),

                    FieldCamps(
                      text: ' Password',
                      isObscure: true,
                      controller: _controllerPasswordRegister,
                    ),

                    FieldCamps(
                      text: ' Confirm password',
                      isObscure: true,
                      controller: _controllerPasswordRegisterConfirm,
                    ),

                    const SizedBox(height: 30),

                    const SizedBox(height: 40),

                    GetStartedButton(onTap: register, text: 'Register now'),

                    const SizedBox(height: 20),

                    Text(
                      stringConf ? ' ' : 'Email ou senha não confere',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
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
