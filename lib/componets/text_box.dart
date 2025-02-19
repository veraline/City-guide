import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function()? onPressed;

  MyTextBox({required this.text, required this.sectionName, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(sectionName, style: TextStyle(color: Colors.grey[500]),),
              IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.settings),
                color: Colors.grey[400],
              )
            ],
          ),

          //text
          Text(text)
        ],
      ),
    );
  }
}
