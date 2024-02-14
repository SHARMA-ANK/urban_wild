import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(176, 232, 190, 1.0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 2),
                      child: Row(
                        children: [
                          Icon(Icons.location_on),
                          Text(
                            "Location",
                            style: GoogleFonts.eastSeaDokdo(
                              fontSize: 35,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white
                    ),

                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 25,
                      backgroundColor: Colors.black,
                    child: Icon(
                        Icons.person,
                      size: 35,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
