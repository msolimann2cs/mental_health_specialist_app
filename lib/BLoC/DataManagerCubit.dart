import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BookingScreenCubit.dart';

part 'DataManagerState.dart';

class DataManagerCubit extends Cubit<DataManagerState> {
  DataManagerCubit() : super(DataManagerState(loggedInUser: ""));

  Future<void> LoginUser(String user) async {
    String fullName = '';
    QuerySnapshot allUsersSnapshot = await firestore.collection("users").get();
    var allUsers = allUsersSnapshot.docs;
    for (int i = 0; i < allUsers.length; i++) {
      print(allUsers.elementAt(i).data());
      if (allUsers.elementAt(i)["username"] == user &&
          allUsers.elementAt(i)["userType"] == "client") {
        fullName = allUsers.elementAt(i)["fullname"];
      }
    }
    print(fullName);
    emit(DataManagerState(loggedInUser: fullName));
  }
}
