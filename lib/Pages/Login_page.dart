import 'package:city_guide_tour/Pages/home_page.dart';
import 'package:city_guide_tour/Pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/my_buuton.dart';
import '../widgets/my_textfield.dart';
import '../widgets/square_container.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Sigin user method
  signInUser() async {
    //show loading
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        });

   // try signing in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      // pop the loading circle
      Navigator.pop(context);

      // Navigate to home page
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
    } on FirebaseAuthException catch (e) {
      print(e);
      Navigator.pop(context);
      Get.snackbar('status', e.message.toString(),);

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset('assets/login.png', height: 200),
                const SizedBox(height: 20),
                Text(
                  'Welcome back, We have missed you 🤭',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: emailController,
                  icon: const Icon(Icons.email),
                  hinttext: 'Enter your email',
                  obsecureText: false,
                ),
                const SizedBox(height: 5),
                MyTextField(
                  controller: passwordController,
                  icon: const Icon(Icons.lock_outline),
                  hinttext: 'Enter your password',
                  obsecureText: true,
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.blue.shade500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                MyButton(
                  text: 'Sign In',
                  onTap: () {
                    // Perform Firebase authentication
                    signInUser();
                    //}
                  },
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareContainer(imagePath: 'assets/google.png'),
                    SizedBox(width: 25),
                    SquareContainer(imagePath: 'assets/twitter 2.png'),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                // Display error message
                // Text(errorMessage, style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
