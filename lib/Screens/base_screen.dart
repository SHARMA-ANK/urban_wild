import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:urban_wild/Screens/add_event_screen.dart';
import 'package:urban_wild/Screens/event_screen.dart';
import 'package:urban_wild/Screens/gardens_screen.dart';
import 'package:urban_wild/Screens/home_screen.dart';
import 'package:urban_wild/models/event.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  bool _isLoading = true;
  List<Event> _events = [];
  late  Event event=Event(name: "jhbdfi", location: "jlhfsdsha", date: "465", time: "4536", description: "sjdfegljhf", additionalInfo: "sjdhga", fileAttachmentUrl: "jhdsfgl");

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  Future<void> _fetchEvents() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Fetch events from Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection('events').get();

      // Convert QuerySnapshot to List<Event>
      List<Event> events = querySnapshot.docs.map((doc) => Event.fromJson(doc.data())).toList();
      print(events[0].name);
      // Update state with fetched events
      setState(() {
        _events = events;
        _isLoading = false;
        event=_events[0];
      });
    } catch (error) {
      // Handle errors
      print('Error fetching events: $error');
      setState(() {
        _isLoading = false;
      });
    }
  }
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(event: event,),
      EventScreen(events: _events),
      const AddEventScreen(),
      const GardenScreen()

    ];
    Widget show=const Center(
      child: CircularProgressIndicator(),
    );
    if(!_isLoading){
      show=screens[_currentIndex];
    }
    return Scaffold(
        //backgroundColor: const Color.fromRGBO(176, 232, 190, 1.0),
        body:show ,
        bottomNavigationBar: BottomNavigationBar(
          type : BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index)
          {
            setState(() {
              _currentIndex = index;
            });
          },
          items:  [
          BottomNavigationBarItem(
          icon: const Icon(Icons.home,size: 30),
          label:"Home".toUpperCase(),

          ),
          BottomNavigationBarItem(
          icon: const Icon(Icons.calendar_month,size: 30),
          label: "Events".toUpperCase()
          ),
          BottomNavigationBarItem(
          icon: const Icon(Icons.add_box_rounded,size: 30),
          label: "Add Event".toUpperCase(),
            backgroundColor: Colors.black
          ),

            BottomNavigationBarItem(
                icon: const FaIcon(FontAwesomeIcons.tree,size: 30,),
                label: "Gardens".toUpperCase(),
                backgroundColor: Colors.black
            ),
          ]
    ,
    )
    ,
    );
  }
}
