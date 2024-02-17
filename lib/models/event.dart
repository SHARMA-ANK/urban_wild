import 'package:uuid/uuid.dart';
const uuid=Uuid();
class Event {
  final String id;
  final String name;
  final String location;
  final String date;
  final String time;
  final String description;
  final String additionalInfo;
  final String fileAttachmentUrl; // Store file path or URL as a string

  Event({

    required this.name,
    required this.location,
    required this.date,
    required this.time,
    required this.description,
    required this.additionalInfo,
    required this.fileAttachmentUrl,
  }) :id=uuid.v4();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'date': date,
      'time': time,
      'description': description,
      'additionalInfo': additionalInfo,
      'fileAttachmentUrl': fileAttachmentUrl,
    };
  }
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(

      name: json['name'],
      location: json['location'],
      date:json['date'],
      time: json['time'],
      description: json['description'],
      additionalInfo: json['additionalInfo'],
      fileAttachmentUrl: json['fileAttachmentUrl'],
    );
  }
}