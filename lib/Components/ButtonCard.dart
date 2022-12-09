import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  ButtonCard({
    super.key,
    required this.buttonText,
    required this.func,
  });
  String buttonText;
  void Function() func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          color: true ? Colors.blueAccent : Colors.blue[50],
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: (TextStyle(
                fontSize: 18,
                color: true ? Colors.white : Colors.blue,
                fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}
