import 'package:flutter/material.dart';
class LocationContainer extends StatelessWidget {
  const LocationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: const Border.fromBorderSide(BorderSide(color: Colors.black,width: 1)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 6, vertical: 2),
        child: Row(
          children: [
            const Icon(Icons.location_on_outlined,size: 35,weight: 10),
            Text(
              "Pune".toUpperCase(),

              style: const TextStyle(
                letterSpacing: 0.5,
                fontFamily: "Lohit Tamil",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,

              ),

            )
          ],
        ),
      ),
    );
  }
}
