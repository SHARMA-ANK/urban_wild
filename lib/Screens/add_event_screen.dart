

import 'dart:io';
import 'package:urban_wild/models/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:urban_wild/widgets/input_textfield.dart';
import 'package:uuid/uuid.dart';


class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key, });

  @override
  _AddEventScreenState createState() => _AddEventScreenState();

}

class _AddEventScreenState extends State<AddEventScreen> {
  // Define controllers for text fields
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventLocationController = TextEditingController();
  DateTime eventDate = DateTime.now();
  TimeOfDay eventTime = TimeOfDay.now();
  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController additionalInfoController = TextEditingController();
  TextEditingController fileAttachmentController = TextEditingController();

  // Define variables for file upload
  FilePickerResult? filePath;
  bool isFileValid = true;
  bool isLoading = false;

  // Function to upload file to Firebase Storage
  Future<String?> _uploadFile(PlatformFile file) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference reference = storage.ref().child('attachments/${const Uuid().v4()}.jpg');

    UploadTask uploadTask = reference.putFile(File(file.path!));

    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  // Function to submit form data
  Future<void> _submitForm() async {
    // Set loading state to true
    setState(() {
      isLoading = true;
    });

    try {
      // Upload file to Firebase Storage
      String? fileAttachmentUrl = await _uploadFile(filePath!.files.first);

      // Create event object
      Event event = Event(
        name: eventNameController.text,
        location: eventLocationController.text,
        date: '${eventDate.year}-${eventDate.month}-${eventDate.day}',
        time: '${eventTime.hour}:${eventTime.minute}',
        description: eventDescriptionController.text,
        additionalInfo: additionalInfoController.text,
        fileAttachmentUrl: fileAttachmentUrl!,
      );

      // Push event data to Firestore
      await FirebaseFirestore.instance.collection('events').add(event.toJson());

      // Clear form fields
      _clearForm();

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Event submitted successfully!')));

      Navigator.pushNamed(context,"/home",arguments: event);
    } catch (error) {
      // Handle errors
      print('Error uploading data: $error');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error uploading data. Please try again later.')));
    }

    // Set loading state to false
    setState(() {
      isLoading = false;
    });
  }

  // Function to clear form fields
  void _clearForm() {
    eventNameController.clear();
    eventLocationController.clear();
    eventDate = DateTime.now();
    eventTime = TimeOfDay.now();
    eventDescriptionController.clear();
    additionalInfoController.clear();
    fileAttachmentController.clear();
    filePath = null;
  }


  //selecting date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != eventDate) {
      setState(() {
        eventDate = picked;
      });
    }
  }

  //selecting time
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != eventTime) {
      setState(() {
        eventTime = picked;
      });
    }
  }


  //selecting file
  Future<void> _selectFile() async {
    FilePickerResult? filePath = (await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg'],
    )) ;

    if (filePath != null) {
      setState(() {
        this.filePath = filePath;
        fileAttachmentController.text = filePath.files.first.name;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(176, 232, 190, 1.0),
      appBar: AppBar(
        title: const Text(
          'Add Event',
          style: TextStyle(
            fontFamily: 'More Sugar'
          ),
        ),backgroundColor: const Color.fromRGBO(176, 232, 190, 1.0),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InputTextWidget(text: "Event Name", textEditingController: eventNameController,maxline: 1),
              const SizedBox(height: 10,),
              InputTextWidget(text: "Event Location", textEditingController: eventLocationController,maxline: 1),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.calendar_month,size: 30,),
                          const SizedBox(width: 4,),
                          Text(eventDate == null
                              ? 'Please select a date'
                              : '${eventDate.year}-${eventDate.month}-${eventDate.day}',
                            style: const TextStyle(
                              fontSize:15
                            ),

                          ),
                        ],
                      ),
                      onTap: () => _selectDate(context),
                    ),
                  ),
                  Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    width: 150,
                    height: 50,
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.access_time_outlined),
                          const SizedBox(width: 4,),
                          Text(eventTime == null
                              ? 'Please select a time'

                              : '${eventTime.hour}:${eventTime.minute}'),
                        ],
                      ),
                      onTap: () => _selectTime(context),
                    ),
                  ),
                ],
              ),

              // ListTile(
              //   title: Text('Event Date'),
              //
              //   subtitle: Text(eventDate == null
              //       ? 'Please select a date'
              //       : '${eventDate.year}-${eventDate.month}-${eventDate.day}'),
              //   onTap: () => _selectDate(context),
              // ),
              const SizedBox(height: 20,),
              InputTextWidget(text: "Event Description", textEditingController: eventDescriptionController, maxline: 10),
              const SizedBox(height: 20,),
              InputTextWidget(text: "Additional Information", textEditingController: additionalInfoController, maxline: 3),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: fileAttachmentController,
                      decoration: InputDecoration(
                        labelText: 'File Attachment (JPG only)',
                        errorText:
                        isFileValid ? null : 'Please upload JPG file only',
                      ),
                      validator: (value) {
                        if (!isFileValid) {
                          return 'Please upload JPG file only';
                        }
                        return null;
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _selectFile,
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Validate form
                  if (_validateForm()) {
                    // Perform submission logic
                    // For now, just print the form data
                   _submitForm();
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    bool isValid = true;
    setState(() {
      if (eventNameController.text.isEmpty ||
          eventLocationController.text.isEmpty ||
          eventDescriptionController.text.isEmpty) {
        isValid = false;
      }
      // Validate file format
      if (!fileAttachmentController.text.endsWith('.jpg')) {
        isFileValid = false;
        isValid = false;
      } else {
        isFileValid = true;
      }
    });
    return isValid;
  }
}
