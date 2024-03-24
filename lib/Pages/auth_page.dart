import 'package:city_guide_tour/Pages/Login_page.dart';
import 'package:city_guide_tour/Pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          //user is log in
          if(snapshot.hasData){
            return HomePage();
          }
          //user not log in
          else{
            return LoginPage();
          }
        },
      ),
    );
  }
}
