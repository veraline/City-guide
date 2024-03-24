import 'package:city_guide_tour/componets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../componets/hotels.dart';

class HotelsPage extends StatelessWidget {
  const HotelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Hotels',
          style:
              GoogleFonts.roboto(color: myColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15.0)),
                  child: Image.asset(
                    hotels[index]['image'],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hotels[index]['name'],
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: myColor,
                          )),
                      const SizedBox(height: 4),
                      Text(
                        hotels[index]['address'],
                        style: GoogleFonts.roboto(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        hotels[index]['description'],
                        style: GoogleFonts.roboto(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
