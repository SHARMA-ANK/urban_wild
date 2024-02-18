import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urban_wild/data/garden_data.dart';
import 'package:urban_wild/models/event.dart';
import 'package:urban_wild/widgets/event_card.dart';
import 'package:urban_wild/widgets/location_container.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/garden.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,required this.event});
  final Event event;
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
  void launchGoogleMaps(String url) async {
    final Uri uri=Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch Google Maps';
    }
  }
  void _showLocationInfo(BuildContext context, Garden garden) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  garden.location,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  garden.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    launchGoogleMaps(garden.googlelink);
                  },
                  child: const Text('More Info'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10,),
                const Row(
                  children: [
                   LocationContainer(),
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
                const SizedBox(
                  height: 20,
                ),
                Text( "Discover".toUpperCase(),
                  style: GoogleFonts.londrinaSketch(
                    fontSize: 80,
                    fontWeight: FontWeight.bold
                  ),
                )
                ,
                SizedBox(
                  width: size.width / (1.3),
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.search),
                      hintText: "Search Destination",
                      hintStyle: const TextStyle(
                        fontFamily: "Lohit Tamil",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,

                      ),

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    controller: _searchController,
                  ),
                ),
            
                //Image Containers
                const SizedBox(height: 25,),
            
                 Text(
                  "Upcoming Events".toUpperCase(),
                  style: const TextStyle(
                      fontFamily: 'Britannic',
                      fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                //const SizedBox(height: 10,),
                EventCard(event: widget.event),
                const SizedBox(height: 10,),
                Text(
                  "Must Visit".toUpperCase(),
                  style: const TextStyle(
                      fontFamily: 'Britannic',
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
            
                      GestureDetector(
                        onTap: (){_showLocationInfo(context,gardens[1]);},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            gardens[1].imageUrl,
                            fit: BoxFit.cover, // Adjusts the image size to fit the container
                            width: (size.width-60)/2, // Allows the container to take the width of its parent
                            height: size.height/4, // Allows the container to take the height of its parent
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){
                          _showLocationInfo(context,gardens[0]);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            gardens[0].imageUrl,
                            fit: BoxFit.cover, // Adjusts the image size to fit the container
                            width: (size.width-60)/2, // Allows the container to take the width of its parent
                            height: size.height/4, // Allows the container to take the height of its parent
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );


  }


}
