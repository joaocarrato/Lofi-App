// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:lofi_app/pages/is_logged.dart';
import 'package:lofi_app/util/get_started_button.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  // METHOD TO GO TO LOGIN PAGE
  void getStartedMethod() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const IsLogged(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // IMAGEM DE WALLPAPER

          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/lofi_wallpaper.png'),
                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              children: [
                const Text(
                  'Sleeply',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const Text(
                  'Meditate, Sleep, Relax',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),

                // BOTÃO DE GET STARTED
                GetStartedButton(
                  text: 'Get Started',
                  onTap: getStartedMethod,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
