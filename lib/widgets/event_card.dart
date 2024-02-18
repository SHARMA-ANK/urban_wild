import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:urban_wild/Screens/event_description.dart';
import 'package:urban_wild/models/event.dart';
import 'package:urban_wild/widgets/event_item_trait.dart';

class EventCard extends StatelessWidget {
   const EventCard({super.key,required this.event});
   final Event event;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(8)),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (ctx)=>EventDescription(event: event)));
          },
          child: Stack(
            children: [
              Hero(
                  tag: event.id,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: FadeInImage(
                          height:size.height/4 ,
                          width: size.width,
                          placeholder: MemoryImage(kTransparentImage),
                          image: NetworkImage(
                            event.fileAttachmentUrl,

                          )
                      )
                  )
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    color: Colors.black54,
      width: 200,

                    child: Column(
                      children: [
                        Text(
                          event.name,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,

                          ),

                        ),
                        const SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           EventItemTrait(icon: Icons.calendar_today,
                                label: event.date
                            ),
                            const SizedBox(width: 12,),
                            EventItemTrait(
                              icon: Icons.timelapse_outlined,
                              label: event.time,
                            ),
                            const SizedBox(width: 12,),
                            EventItemTrait(
                              icon: Icons.location_on,
                              label: event.location ,

                            )
                          ],
                        )

                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
