import 'package:flutter/material.dart';
import 'package:urban_wild/Screens/event_screen.dart';
import 'package:urban_wild/Screens/home_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    EventScreen()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(176, 232, 190, 1.0),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index)
          {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label:"Home",

          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: "Events"
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.add_box_rounded),
          label: "Add Event"
          )
          ]
    ,
    )
    ,
    );
  }
}
