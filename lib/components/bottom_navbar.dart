import 'package:flutter/material.dart';

class bt_navbar extends StatelessWidget {
  const bt_navbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                (Icons.home_outlined),
                size: 28,
                color: Colors.blue,
              ),
              Text(
                'Home',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                (Icons.article_outlined),
                size: 28,
              ),
              Text('Dashboard'),
            ],
          ),
          // GestureDetector(
          //   onTap: () {
          //     //Navigator.pushNamed(context, BookingScreenOne.id);
          //   },
          //   child: const Icon(
          //     (Icons.add_outlined),
          //     size: 57,
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                (Icons.chat_outlined),
                size: 28,
              ),
              Text('Chat'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                (Icons.account_circle_outlined),
                size: 28,
              ),
              Text('Profile')
            ],
          ),
        ],
      ),
    );
  }
}
