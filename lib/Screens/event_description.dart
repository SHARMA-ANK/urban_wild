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
          event.name,
          style: const TextStyle(
            fontFamily: 'More Sugar',
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

                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          children: [const Icon(Icons.access_time_filled,size: 30,),const SizedBox(width: 7,), Text(event.time,style:const TextStyle(fontSize: 20),)],
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
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 30,
                        ),
                        const SizedBox(width: 2,),
                        Text(
                          event.location,
                          style: const TextStyle(
                            fontSize: 20
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15.0,left: 15,top: 15),
                child: Text(
                  "Description",
                  style: TextStyle(
                      fontFamily: 'More Sugar',
                      fontSize: 20
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
                      ),
                    ),
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(right: 15.0,left: 15,top: 15),
                child: Text(
                  "Additional Information",
                  style: TextStyle(
                      fontFamily: 'More Sugar',
                      fontSize: 20
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
