import 'package:flutter/material.dart';

class EventItemTrait extends StatelessWidget {
  const EventItemTrait({super.key,required this.icon,required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Icon(
          icon,size: 17,
          color:Colors.white,
        ),
        const SizedBox(width: 8,),
        Text(
          label.length > 12 ? '${label.substring(0, 12)}...' : label,
          style:const  TextStyle(
              color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),


        )
      ],
    );
  }
}
