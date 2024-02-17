import 'package:flutter/material.dart';
import 'package:urban_wild/widgets/event_card.dart';
import 'package:urban_wild/widgets/location_container.dart';
import 'package:urban_wild/widgets/sugar_text.dart';
import 'package:urban_wild/models/event.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key, required this.events});
  final List<Event> events;
  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final bool _isLoading=false;
  @override
  Widget build(BuildContext context) {
    Widget actualScreen=SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        child: Column(
          children: [
            const Row(
              children: [
                SugarText(text: "Events", fontSize: 40),
                Spacer(),
                LocationContainer()
              ],
            ),
            Expanded(
              child: ListView(
                  children: List.generate(
                    widget.events.length,
                        (index) => EventCard(event: widget.events[index],),
                  )),
            )
          ],
        ),
      ),
    );
    if(_isLoading){
      return const Center(
        child: CircularProgressIndicator()
      );
    }
    return actualScreen;
  }
}
