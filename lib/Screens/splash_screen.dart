import 'dart:async';

import 'package:flutter/material.dart';
import 'package:urban_wild/Screens/base_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      // Navigate to your main screen
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500), // Duration of the transition animation
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) => const BaseScreen(), // Your home screen
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(176, 232, 190, 1.0),
      body: Center(
       child: Container(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const Text(
               "Urban Wild",
               style: TextStyle(
                 fontSize: 60,
                 fontWeight: FontWeight.bold,
                 fontFamily: 'Quiapo',
                 letterSpacing: 3,
                 wordSpacing: 10
               ),
             ),
             const SizedBox(height: 5,),
             Container(

               child: ClipRRect(
                 borderRadius: BorderRadius.circular(20.0),
                 child: Image.asset(
                   "assets/images/Urban_Wild_Logo.png",
                   fit: BoxFit.cover, // Adjusts the image size to fit the container
                   width: size.width/1.2, // Allows the container to take the width of its parent
                   height: size.height/3, // Allows the container to take the height of its parent
                 ),
               ),
             ),

           ],
         ),
       )
      )
    );
  }
}
