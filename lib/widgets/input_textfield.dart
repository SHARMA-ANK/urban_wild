import 'package:flutter/material.dart';
class InputTextWidget extends StatefulWidget {
  const InputTextWidget({super.key,required this.text ,required this.textEditingController,required this.maxline});
  final String text;
  final TextEditingController textEditingController;
  final int maxline;
  @override
  State<InputTextWidget> createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {


  @override
  Widget build(BuildContext context) {
    return  TextFormField(
        maxLines: widget.maxline,

        controller: widget.textEditingController,
        decoration: InputDecoration(
          labelText: widget.text.toUpperCase(),
          labelStyle: const TextStyle(
            fontFamily: "Lohit Tamil",
            fontWeight: FontWeight.bold
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),

          filled: true,
          fillColor: Colors.white
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return '${widget.text} is required';
          }
          return null;
        },

    );
  }
}
