import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/BLoC/BookingScreenCubit.dart';
import 'package:mental_health/BLoC/ChatScreenCubit.dart';
import 'package:mental_health/Components/ButtonCard.dart';
import 'package:mental_health/Components/TopNavBar.dart';

import '../BLoC/DataManagerCubit.dart';
import '../Components/ChatBubble.dart';
import 'PayScreen.dart';

class MainChatScreen extends StatefulWidget {
  const MainChatScreen({Key? key}) : super(key: key);
  static String id = "main_chat_screen";
  @override
  State<MainChatScreen> createState() => _MainChatScreenState();
}

class _MainChatScreenState extends State<MainChatScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    String userText = '';
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Row(
              //   children: [
              //     Text(
              //       "<",
              //       style: TextStyle(fontSize: 40),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(left: 40.0),
              //       child: Text(
              //         args,
              //         style: TextStyle(
              //             fontSize: 30, fontWeight: FontWeight.w500),
              //       ),
              //     )
              //   ],
              // ),
              TopNavBar(title: args),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 10, left: 10, top: 10.0),
                  child: BlocBuilder<ChatScreenCubit, ChatScreenState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return state.messages[index];
                          },
                          itemCount: state.messages.length,
                          scrollDirection: Axis.vertical,
                        ),
                      );
                    },
                  ),
                  // child: Column(
                  //   children: [
                  //     ChatBubble(
                  //       text: "Hello, do you mind if we change the reservation"
                  //           " from today to tomorrow same time?",
                  //       isSender: true,
                  //     ),
                  //     ChatBubble(
                  //       text: ("No problem!"),
                  //       isSender: false,
                  //     ),
                  //     ChatBubble(
                  //       text: ("Thanks!"),
                  //       isSender: true,
                  //     ),
                  //   ],
                  // ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          userText = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Type a message',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ButtonCard(
                          buttonText: "Send",
                          func: () {
                            String userFullName =
                                BlocProvider.of<DataManagerCubit>(context)
                                    .state
                                    .loggedInUser;
                            String docName =
                                "chat: " + userFullName + " - " + args;
                            firestore
                                .collection('chats')
                                .doc(docName)
                                .collection('messages')
                                .add({
                              'sender': userFullName,
                              'text': userText,
                              'timestamp': FieldValue.serverTimestamp(),
                            });
                            BlocProvider.of<ChatScreenCubit>(context)
                                .LoadCertainChats(userFullName, args);
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
