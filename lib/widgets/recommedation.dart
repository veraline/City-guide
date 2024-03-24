import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Pages/detail_page.dart';
import '../componets/colors.dart';

class Recommedation extends StatelessWidget {
   Recommedation({super.key});
  List<Map<String, dynamic>> recommend =[
    {
      'name' : 'Sharon Hotel ',
      'image' : 'assets/hotels/third hotel-min.jpg',
      'location' : 'Lagos, Nigeria',
      'description' : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    },
    {
      'name' : 'GameZone Lagos',
      'image' : 'assets/Games_center/game-one-min.png',
      'location' : 'Ikeja, Lagos',
      'description' : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    },

    {
      'name' : 'Next Cash and Carry',
      'image' : 'assets/supermarket.jpg',
      'location' : 'Abuja, Nigeria',
      'description' : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    },

    {
      'name' : 'KFC',
      'image' : 'assets/Kfc 2.jpg',
      'location' : 'Port- Harcourt, Nigeria',
      'description' : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    }

  ];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommend.length,
        itemBuilder: (context, index) {
          var item = recommend[index];
          return GestureDetector(
            onTap: (){
              Get.to(DetailContent(
                name: item['name'],
                image: item['image'],
                location: item['location'],
                description: item['description'],
              ));
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors
                      .white, // Specify your desired border color here
                  width: 1, // Specify the width of the border
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Specify the shadow color
                    spreadRadius: 2, // Specify the spread radius
                    blurRadius: 5, // Specify the blur radius
                    offset: const Offset(0, 3), // Specify the offset
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      item['image'],
                      height: 160,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    item['name'],
                    style: GoogleFonts.roboto(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text( item['location'] ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
