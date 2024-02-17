import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LocationContainer extends StatelessWidget {
  const LocationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 4.0, vertical: 2),
        child: Row(
          children: [
            const Icon(Icons.location_on),
            Text(
              "Pune",
              style: GoogleFonts.eastSeaDokdo(
                  fontSize: 35, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
