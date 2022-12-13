import 'package:flutter/material.dart';
import 'package:mental_health/Components/BottomNavBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/BLoC/ChatScreenCubit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static String id = 'chat_screen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15, left: 30, bottom: 25.0),
                  child: Text(
                    "Chats",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                  ),
                ),
                BlocBuilder<ChatScreenCubit, ChatScreenState>(
                    builder: (context, state) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return state.chats[index];
                        },
                        itemCount: state.chats.length,
                        scrollDirection: Axis.vertical,
                      ),
                    ),
                  );
                }),
                BottomNavBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
