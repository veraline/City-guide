import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../componets/colors.dart';

class CircleImage extends StatelessWidget {
  final String imageUrl;
  final String text;

  CircleImage({required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(50),
          ),
          width: 70,
          height: 70,
          child: ClipOval(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        //Text
        Text(
          text,
          style:
              GoogleFonts.roboto(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    );
  }
}
