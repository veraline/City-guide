import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../componets/camp.dart';
import '../componets/colors.dart';

class CampPage extends StatelessWidget {
  const CampPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Camp', style: GoogleFonts.roboto(color: myColor, fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: camps.length,
        itemBuilder: (context, index) {
          return  Card(
              margin: EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                    child: Image.asset(
                      camps[index]['imageUrl'],
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            camps[index]['name'],
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: myColor,
                            )
                        ),
                        const SizedBox(height: 4),
                        Text(
                          camps[index]['location'],
                          style: GoogleFonts.roboto(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          camps[index]['description'],
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
