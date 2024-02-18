import 'package:flutter/material.dart';
import 'package:urban_wild/models/event.dart';

class EventDescription extends StatelessWidget {
  const EventDescription({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          event.name.toUpperCase(),
          style: TextStyle(
              fontFamily: "Lohit Tamil",
              fontWeight: FontWeight.values[8],
              fontSize: 20,
              color: const Color.fromARGB(255, 67, 104, 80)
          ),

        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Hero(
                tag: event.id,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Image.network(
                    event.fileAttachmentUrl,
                    
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0,left: 15,top: 15),
                child: Row(

                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                size: 30,
                              ),
                              const SizedBox(width: 7,),
                              Text(
                                event.date,

                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Lohit Tamil"
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                          child: Row(
                            children: [const Icon(Icons.access_time_filled,size: 30,),const SizedBox(width: 7,), Text(event.time,style:const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lohit Tamil"
                            ),)],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 15.0,left: 15,top: 15),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 30,
                          ),
                          const SizedBox(width: 2,),
                          Text(
                            event.location.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lohit Tamil"
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15.0,left: 15,top: 15),
                child: Text(
                  "Description",
                  style: TextStyle(
                      fontFamily: "Lohit Tamil",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 67, 104, 80)
                  ),
                ),
              ),
              Padding(
                padding:const EdgeInsets.only(right: 15.0,left: 15,top: 15),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      event.description,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Lohit Tamil"
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 15.0,left: 15,top: 15),
                child: Text(
                  "Additional Information".toUpperCase(),
                  style: const TextStyle(
                      fontFamily: "Lohit Tamil",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 67, 104, 80)
                  ),
                ),
              ),
              Padding(
                padding:const EdgeInsets.only(right: 15.0,left: 15,top: 15),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      event.additionalInfo,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Lohit Tamil"
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
