import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/garden_data.dart';
import '../models/garden.dart';
class GardenScreen extends StatelessWidget {
  const GardenScreen({super.key});
  void launchGoogleMaps(String url) async {
  final Uri uri=Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch Google Maps';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gardens',style: TextStyle(fontFamily: "More Sugar"),),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: gardens.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showLocationInfo(context, gardens[index]);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                gardens[index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
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
}
