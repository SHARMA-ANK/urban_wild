import 'package:uuid/uuid.dart';
const uuid=Uuid();
class Garden {
  final String gardenId;
  final String name;
  final String location;
  final String description;
  final String imageUrl;
  final String googlelink;

  Garden({

    required this.name,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.googlelink,
  }):gardenId=uuid.v4();

  // Factory method to create a Garden instance from a map
  Map<String, dynamic> toJson() {
    return {
      'gardenId': gardenId,
      'name': name,
      'location': location,
      'description': description,
      'imageUrl':imageUrl,
      'googlelink':googlelink
    };
  }
  factory Garden.fromJson(Map<String, dynamic> json) {
    return Garden(

      name: json['name'],
      location: json['location'],
      description: json['description'],
      imageUrl: json['imageUrl'],
        googlelink:json['googlelink']
    );
  }
}
