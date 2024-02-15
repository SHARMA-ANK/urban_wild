

import 'package:flutter/material.dart';
import 'package:urban_wild/widgets/event_card.dart';
import 'package:urban_wild/widgets/sugar_text.dart';
class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        child: Column(
          children: [
            Row(
              children: [
                SugarText(text: "Events", fontSize: 40),
                ListView.builder(
                    itemCount: 7,
                    itemBuilder: (ctx,index)=>EventCard(),


                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
