import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({Key? key, required this.text, required this.isSender})
      : super(key: key);
  String text;
  bool isSender = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Padding(
        padding: isSender
            ? EdgeInsets.only(left: 180.0)
            : EdgeInsets.only(right: 180),
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text),
          ),
          decoration: BoxDecoration(
            color:
                isSender ? Colors.lightBlue[200] : Colors.lightGreenAccent[100],
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
