import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/BLoC/BookingScreenCubit.dart';
import 'package:mental_health/Components/ChatBubble.dart';

import '../Components/ChatSpecialistCard.dart';

part 'ChatScreenState.dart';

class ChatScreenCubit extends Cubit<ChatScreenState> {
  ChatScreenCubit() : super(ChatScreenState(chats: [], messages: []));

  Future<void> LoadChats(String loggedInUser) async {
    state.chats = [];
    List<ChatSpecialistCard> l1 = [];
    QuerySnapshot allChatsSnapshot = await firestore.collection("chats").get();
    var allChats = allChatsSnapshot.docs;
    for (int i = 0; i < allChats.length; i++) {
      var chatID = allChats.elementAt(i).id;
      //print(chatID.substring(chatID.indexOf(':') + 2, chatID.indexOf("-") - 1));
      var firstUser =
          chatID.substring(chatID.indexOf(':') + 2, chatID.indexOf("-") - 1);
      var secondUser = chatID.substring(chatID.indexOf('-') + 2, chatID.length);
      //print(secondUser);
      // if (firstUser == "Mohamed A. Soliman" &&
      //     secondUser == "Dr. Maram Tolba") {
      //   print("hi");
      // }
      if (firstUser == loggedInUser) {
        print('hi');
        QuerySnapshot allUsersSnapshot =
            await firestore.collection("specialists").get();
        var allSpecialists = allUsersSnapshot.docs;
        for (int i = 0; i < allSpecialists.length; i++) {
          if (secondUser == "Dr. " + allSpecialists.elementAt(i)["fullName"]) {
            String specailistName = allSpecialists.elementAt(i)["fullName"];
            String specailistType =
                allSpecialists.elementAt(i)["specialistType"];
            String specailistCost = allSpecialists.elementAt(i)["cost"];
            String specialistImage = allSpecialists.elementAt(i)["image"];
            List<dynamic> specialistGenre =
                allSpecialists.elementAt(i)["specialistGenres"];
            List<String> s = [];
            specialistGenre.forEach((element) {
              s.add(element);
            });
            ChatSpecialistCard card = ChatSpecialistCard(
              doctor_name: "Dr. " + specailistName,
              doctor_type: specailistType,
              image: NetworkImage(specialistImage),
              specialist_genres: s,
            );
            // testest.add(card);
            l1.add(card);
          }
        }
      }
    }
    emit(ChatScreenState(chats: l1, messages: state.messages));
  }

  void LoadCertainChats(String loggedInUser, String specialist) async {
    state.messages = [];
    List<ChatBubble> l1 = [];
    QuerySnapshot allChatsSnapshot = await firestore.collection("chats").get();
    var allChats = allChatsSnapshot.docs;
    for (int i = 0; i < allChats.length; i++) {
      var chatID = allChats.elementAt(i).id;
      //print(chatID.substring(chatID.indexOf(':') + 2, chatID.indexOf("-") - 1));
      var firstUser =
          chatID.substring(chatID.indexOf(':') + 2, chatID.indexOf("-") - 1);
      var secondUser = chatID.substring(chatID.indexOf('-') + 2, chatID.length);
      if (firstUser == loggedInUser && secondUser == specialist) {
        QuerySnapshot allMessagesSnapshot = await firestore
            .collection('chats')
            .doc(allChats.elementAt(i).id)
            .collection('messages')
            .orderBy('timestamp')
            .get();
        var allMessages = allMessagesSnapshot.docs;
        //print(allMessages);
        for (int j = 0; j < allMessages.length; j++) {
          print(allMessages.elementAt(j).data());
          String sender = allMessages.elementAt(j)['sender'];
          String text = allMessages.elementAt(j)['text'];
          bool isSender = true;
          if (sender == firstUser) {
            isSender = true;
          } else {
            isSender = false;
          }
          ChatBubble bubble = ChatBubble(text: text, isSender: isSender);
          l1.add(bubble);
        }
      }
    }
    emit(ChatScreenState(chats: state.chats, messages: l1));
  }
}
