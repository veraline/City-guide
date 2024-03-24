import 'package:city_guide_tour/Pages/camp_page.dart';
import 'package:city_guide_tour/Pages/events_page.dart';
import 'package:city_guide_tour/Pages/games_page.dart';
import 'package:city_guide_tour/Pages/profile_page.dart';
import 'package:city_guide_tour/componets/colors.dart';
import 'package:city_guide_tour/widgets/image_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../componets/my_list_tile.dart';
import '../widgets/recommedation.dart';
import 'hotels_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void SighOut() {
    FirebaseAuth.instance.signOut();
  }

  void GoToProfilePage(){
     Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage()));
  }

  @override
  Widget build(BuildContext context) {
    final borderDecoration = OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(20));

    return Scaffold(
      drawer: Drawer(
        backgroundColor: myColor,
        child: Column(
          children: [
            // header
            const Padding(
              padding: EdgeInsets.all(50.0),
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 64,
              ),
            ),

            MyListTile(
              icon: Icons.home,
              text: 'H O M E',
              onTap: () => Navigator.pop(context),
            ),

            MyListTile(
              icon: Icons.person,
              text: 'P R O F I L E',
              onTap: GoToProfilePage,
            ),

            MyListTile(
              icon: Icons.logout,
              text: 'L O G O U T',
              onTap:  SighOut,
            ),

          ],
        ),
      ),
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        children: [
          Text(
            "Discover",
            style: GoogleFonts.roboto(
                color:myColor, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Text(
            'the best places to explore',
            style: GoogleFonts.roboto(fontSize: 20, color: Colors.black),
          ),
          const SizedBox(
            height: 15,
          ),
          // Text-Field for search bar
          TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: 'Search ...',
                hintStyle: GoogleFonts.roboto(color: Colors.grey),
                enabledBorder: borderDecoration,
                focusedBorder: borderDecoration),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Hotel
              GestureDetector(
                  onTap: () {

                    Get.to(const HotelsPage());
                  },
                  child:
                      CircleImage(text: 'Hotels', imageUrl: 'assets/hotels/hotels.png')),

              //Event
              GestureDetector(
                  onTap: () {
                    Get.to(const EventPage());
                  },
                  child:
                      CircleImage(text: 'Events', imageUrl: 'assets/events.png')),

              //Games
              GestureDetector(
                  onTap: () {
                    Get.to(const GamePage());
                  },
                  child:
                      CircleImage(text: 'Games', imageUrl: 'assets/Games_center/games.png')),

              // Camp
              GestureDetector(
                  onTap: () {
                    Get.to(const CampPage());
                  },
                  child: CircleImage(text: 'Camp', imageUrl: 'assets/camp.png'))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          //Recommended
          Text(
            'Recommendation',
            style: GoogleFonts.roboto(
                fontSize: 25, fontWeight: FontWeight.bold, color: myColor),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 300,
            child: Recommedation(),
          ),
        ],
      ),
    );
  }
}
