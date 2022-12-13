import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mental_health/components/BookingDayCard.dart';

import '../components/BookingHourCard.dart';
import '../screens/BookingScreen.dart';

part 'BookingScreenState.dart';

final firestore = FirebaseFirestore.instance;

List<BookingDayCard> specialistAvailableDays = [];
List<BookingHourCard> specialistAvailableTimes = [];

class BookingScreenCubit extends Cubit<BookingScreenState> {
  BookingScreenCubit()
      : super(BookingScreenState(
            specialistAvailableDays: [], specialistAvailableTimes: []));

  void SwitchFocusBookingDay(String dayName) {
    for (int i = 0; i < state.specialistAvailableDays.length; i++) {
      specialistAvailableDays = state.specialistAvailableDays;
    }

    for (int i = 0; i < specialistAvailableDays.length; i++) {
      specialistAvailableDays.elementAt(i).isClicked = false;
      if (specialistAvailableDays.elementAt(i).dayName == dayName) {
        specialistAvailableDays.elementAt(i).isClicked = true;
      }
    }

    print(specialistAvailableDays);
    List<BookingDayCard> temp_list = [];
    print(temp_list);

    for (int i = 0; i < specialistAvailableDays.length; i++) {
      BookingDayCard temp_item = BookingDayCard(
          dayName: specialistAvailableDays.elementAt(i).dayName,
          dayDate: specialistAvailableDays.elementAt(i).dayDate,
          isClicked: specialistAvailableDays.elementAt(i).isClicked);
      temp_list.add(temp_item);
    }
    print(temp_list);
    emit(state.copyWith(
        test3: temp_list, test4: state.specialistAvailableTimes));
  }

  BookingDayCard getClickedDay() {
    for (int i = 0; i < specialistAvailableDays.length; i++) {
      //specialistAvailableDays.elementAt(i).isClicked = false;
      if (specialistAvailableDays.elementAt(i).isClicked) {
        //print(specialistAvailableDays.elementAt(i));
        return specialistAvailableDays.elementAt(i);
      }
    }
    return specialistAvailableDays.elementAt(0);
  }

  String getClickedHour() {
    for (int i = 0; i < specialistAvailableTimes.length; i++) {
      //specialistAvailableDays.elementAt(i).isClicked = false;
      if (specialistAvailableTimes.elementAt(i).isClicked) {
        return specialistAvailableTimes.elementAt(i).hour;
      }
    }
    return "null";
  }

  void SwitchFocusBookingHour(String dayHour) {
    for (int i = 0; i < state.specialistAvailableTimes.length; i++) {
      specialistAvailableTimes = state.specialistAvailableTimes;
    }

    for (int i = 0; i < specialistAvailableTimes.length; i++) {
      specialistAvailableTimes.elementAt(i).isClicked = false;
      if (specialistAvailableTimes.elementAt(i).hour == dayHour) {
        specialistAvailableTimes.elementAt(i).isClicked = true;
      }
    }
    print(specialistAvailableTimes);

    //print(specialistAvailableTimes);
    List<BookingHourCard> temp_list = [];
    //print(temp_list);

    for (int i = 0; i < state.specialistAvailableTimes.length; i++) {
      BookingHourCard temp_item = BookingHourCard(
          hour: state.specialistAvailableTimes.elementAt(i).hour,
          isClicked: state.specialistAvailableTimes.elementAt(i).isClicked);
      temp_list.add(temp_item);
    }
    print(temp_list);
    emit(
        state.copyWith(test3: state.specialistAvailableDays, test4: temp_list));
  }

  Future<void> LoadDaysFromDB(String specialistName) async {
    // final snapshot = await firestore.collectionGroup('bookingDays').get();
    final snapshot = await firestore
        .collection('users')
        .doc(specialistName)
        .collection('bookingDays')
        .get();
    final test_arr = snapshot.docs.map((doc) => doc.data()).toList();
    //print(test_arr);
    // List<String> dayNames = test_arr.fold<List<String>>(
    //     [], (prev, element) => List.from(prev)..add(element['dayName']));
    // List<String> dayDates = test_arr.fold<List<String>>(
    //     [], (prev, element) => List.from(prev)..add(element['dayDate']));
    // print(dayNames);
    test_arr.sort((a, b) {
      return (a['dayDate']).compareTo(b['dayDate']);
    });
    print(test_arr.length);

    specialistAvailableDays.clear();
    print(specialistAvailableDays);
    for (int i = 0; i < test_arr.length; i++) {
      BookingDayCard bookingDay = BookingDayCard(
        dayName: test_arr[i]["dayName"],
        dayDate: test_arr[i]["dayDate"],
        isClicked: false,
      );
      specialistAvailableDays.add(bookingDay);
    }
    print(specialistAvailableDays);
    emit(BookingScreenState(
        specialistAvailableDays: specialistAvailableDays,
        specialistAvailableTimes: state.specialistAvailableTimes));
    //return specialistAvailableDays;
  }
}
