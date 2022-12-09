import 'dart:ffi';

import 'package:flutter/material.dart';

class TopNavBar extends StatelessWidget {
  TopNavBar({
    super.key,
    required this.title,
  });
  String title;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    print(deviceWidth);
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "<",
              style: TextStyle(fontSize: 40),
            ),
          ),
          Container(
            width: deviceWidth - 21 - 21 - 40,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// const EdgeInsets.only(left: 20, top: 10, bottom: 10),
