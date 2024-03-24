import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../componets/colors.dart';

class DetailContent extends StatelessWidget {
  final String name;
  final String image;
  final String location;
  final String description;

  const DetailContent(
      {required this.name,
      required this.image,
      required this.location,
      required this.description,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(image),
                      ),
                      Positioned(
                        top: 10, // Adjust the top position of the text
                        left: 10, // Adjust the left position of the text
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: textColor,
                                size: 30,
                              ),
                            )),
                      ),
                      Positioned(
                        top: 10, // Adjust the top position of the text
                        right: 10, // Adjust the left position of the text
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: textColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Icon(
                              FontAwesomeIcons.heart,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                      Positioned(
                          bottom: 10,
                          left: 10,
                          child: Text(
                            '99/Person',
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                location,
                style: GoogleFonts.roboto(
                    fontSize: 25, color: myColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Description',
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(description),
              Text(description)
            ],
          ),
        ),
      ),
    );
  }
}
