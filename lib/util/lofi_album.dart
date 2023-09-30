import 'package:flutter/material.dart';

class LofiAlbum extends StatelessWidget {
  final String imagePath;
  final String title;
  const LofiAlbum({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.play_circle_outline,
                  color: Colors.white60,
                  size: 35,
                ),
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Lorem ipsum dolor conse\nMauris sollicitudin feugiat\nQuisque in tristique lorem\nVivamus vita',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20.0, left: 10),
          child: Align(
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white38,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
