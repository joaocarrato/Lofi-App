import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lofi_app/classes/album_class.dart';
import 'package:lofi_app/util/lofi_album.dart';

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
          icon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.logout,
              size: 40,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My list',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    letterSpacing: 1,
                  ),
                ),
                Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 35,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.8,
            color: Colors.grey[400],
          ),

          // ALBUMS DE LOFI

          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return LofiAlbum(
                  imagePath: myLofiAlbums[index].imagePath,
                  title: myLofiAlbums[index].title,
                );
              },
              separatorBuilder: (context, index) => Divider(
                thickness: 0.8,
                color: Colors.grey[400],
              ),
              itemCount: myLofiAlbums.length,
            ),
          )
        ],
      ),
    );
  }
}
