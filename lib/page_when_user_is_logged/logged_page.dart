import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoggedPage extends StatelessWidget {
  const LoggedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('##12091A'),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          icon: const Icon(
            Icons.logout,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Logged as ${FirebaseAuth.instance.currentUser?.email}')
          ],
        ),
      ),
    );
  }
}
