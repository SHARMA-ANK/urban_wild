import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urban_wild/widgets/sugar_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Search Functionality
  final _searchController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 2),
                      child: Row(
                        children: [
                          Icon(Icons.location_on),
                          Text(
                            "Location",
                            style: GoogleFonts.eastSeaDokdo(
                                fontSize: 35, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
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
              ),
              SizedBox(
                height: 30,
              ),
              SugarText(text: "Discover",fontSize: 45,)
              ,
              Container(
                width: size.width / (1.5),
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    hintText: "Search Destination",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  controller: _searchController,
                ),
              ),

              //Image Containers
              SizedBox(height: 30,),

              Text(
                "Upcoming Events",
                style: TextStyle(
                    fontFamily: 'More Sugar',
                    fontSize: 20
                ),),
              SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  "assets/images/marathon.jpg",
                  fit: BoxFit.cover, // Adjusts the image size to fit the container
                  width: double.infinity, // Allows the container to take the width of its parent
                  height: size.height/4, // Allows the container to take the height of its parent
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        "assets/images/marathon.jpg",
                        fit: BoxFit.cover, // Adjusts the image size to fit the container
                        width: (size.width-60)/2, // Allows the container to take the width of its parent
                        height: size.height/4, // Allows the container to take the height of its parent
                      ),
                    ),
                    Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        "assets/images/marathon.jpg",
                        fit: BoxFit.cover, // Adjusts the image size to fit the container
                        width: (size.width-60)/2, // Allows the container to take the width of its parent
                        height: size.height/4, // Allows the container to take the height of its parent
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );


  }
}
