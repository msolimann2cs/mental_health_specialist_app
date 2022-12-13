import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/BLoC/ChatScreenCubit.dart';
import 'package:mental_health/Screens/ChatScreen.dart';
import 'package:mental_health/Screens/DashboardScreen.dart';
import 'package:mental_health/Screens/HomeScreen.dart';
import 'package:mental_health/Screens/ProfileScreen.dart';

import '../BLoC/DataManagerCubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var pageID = ModalRoute.of(context)?.settings.name;
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
          GestureDetector(
            onTap: () {
              if (!(pageID == MainScreen.id)) {
                Navigator.pop(context);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  (Icons.home_outlined),
                  size: 28,
                  color: pageID == MainScreen.id ? Colors.blue : Colors.black,
                ),
                Text(
                  'Home',
                  style: TextStyle(
                      color:
                          pageID == MainScreen.id ? Colors.blue : Colors.black),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (pageID == MainScreen.id) {
                Navigator.pushNamed(context, DashboardScreen.id);
              } else if (pageID == DashboardScreen.id) {
              } else {
                Navigator.pop(context);
                Navigator.pushNamed(context, DashboardScreen.id);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  (Icons.article_outlined),
                  size: 28,
                  color:
                      pageID == DashboardScreen.id ? Colors.blue : Colors.black,
                ),
                Text(
                  'Dashboard',
                  style: TextStyle(
                      color: pageID == DashboardScreen.id
                          ? Colors.blue
                          : Colors.black),
                ),
              ],
            ),
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
          GestureDetector(
            onTap: () {
              if (pageID == MainScreen.id) {
                var loggedInUser = BlocProvider.of<DataManagerCubit>(context)
                    .state
                    .loggedInUser;
                print(loggedInUser);
                BlocProvider.of<ChatScreenCubit>(context)
                    .LoadChats(loggedInUser);
                Navigator.pushNamed(context, ChatScreen.id);
              } else if (pageID == ChatScreen.id) {
              } else {
                var loggedInUser = BlocProvider.of<DataManagerCubit>(context)
                    .state
                    .loggedInUser;
                BlocProvider.of<ChatScreenCubit>(context)
                    .LoadChats(loggedInUser);
                Navigator.pop(context);
                Navigator.pushNamed(context, ChatScreen.id);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  (Icons.chat_outlined),
                  size: 28,
                  color: pageID == ChatScreen.id ? Colors.blue : Colors.black,
                ),
                Text(
                  'Chat',
                  style: TextStyle(
                      color:
                          pageID == ChatScreen.id ? Colors.blue : Colors.black),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (pageID == MainScreen.id) {
                Navigator.pushNamed(context, ProfileScreen.id);
              } else if (pageID == ProfileScreen.id) {
              } else {
                Navigator.pop(context);
                Navigator.pushNamed(context, ProfileScreen.id);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon((Icons.account_circle_outlined),
                    size: 28,
                    color: pageID == ProfileScreen.id
                        ? Colors.blue
                        : Colors.black),
                Text(
                  'Profile',
                  style: TextStyle(
                      color: pageID == ProfileScreen.id
                          ? Colors.blue
                          : Colors.black),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
