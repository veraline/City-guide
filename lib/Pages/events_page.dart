import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../componets/colors.dart';
import '../componets/events.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Events',
          style:
              GoogleFonts.roboto(color: myColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: events.length,
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
                    events[index]['image'],
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
                      Text(events[index]['name'],
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: myColor,
                          )),
                      const SizedBox(height: 4),
                      Text(
                        events[index]['location'],
                        style: GoogleFonts.roboto(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        events[index]['description'],
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
