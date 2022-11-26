import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'doctor_card.dart';

part 'specialist_view_state.dart';

List<DoctorCard> testest = [
  DoctorCard(
    doctor_name: "Dr. Mariam Kreig",
    doctor_type: "Clinical Psychologist",
    image: NetworkImage(
        "https://media.istockphoto.com/photos/portrait-of-smiling-mixed-race-woman-looking-at-camera-picture-id1319763830?k=20&m=1319763830&s=612x612&w=0&h=ooguDiiKrPmsnN4MKQ7S1pIfddwAqXnqF7XW4MF6gM8="),
    specialist_genres: ['All', 'Stress'],
  ),
  DoctorCard(
    doctor_name: "Dr. Donia Daniel",
    doctor_type: "Clinical Psychologist",
    image: NetworkImage(
        "https://media.istockphoto.com/photos/portrait-of-smiling-mixed-race-woman-looking-at-camera-picture-id1319763830?k=20&m=1319763830&s=612x612&w=0&h=ooguDiiKrPmsnN4MKQ7S1pIfddwAqXnqF7XW4MF6gM8="),
    specialist_genres: ['All', 'Stress', 'Anxiety'],
  ),
  DoctorCard(
    doctor_name: "Dr. Rana Tobias",
    doctor_type: "Clinical Psychologist",
    image: NetworkImage(
        "https://media.istockphoto.com/photos/portrait-of-smiling-mixed-race-woman-looking-at-camera-picture-id1319763830?k=20&m=1319763830&s=612x612&w=0&h=ooguDiiKrPmsnN4MKQ7S1pIfddwAqXnqF7XW4MF6gM8="),
    specialist_genres: ['All', 'Depression'],
  ),
  DoctorCard(
    doctor_name: "Dr. Amira Evan",
    doctor_type: "Clinical Psychologist",
    image: NetworkImage(
        "https://media.istockphoto.com/photos/portrait-of-smiling-mixed-race-woman-looking-at-camera-picture-id1319763830?k=20&m=1319763830&s=612x612&w=0&h=ooguDiiKrPmsnN4MKQ7S1pIfddwAqXnqF7XW4MF6gM8="),
    specialist_genres: ['All', 'Family Grief'],
  ),
];

class SpecialistCubit extends Cubit<SpecialistState> {
  SpecialistCubit()
      : super(SpecialistState(isSearchOn: false, test: testest, test3: []));

  // bool searchType(){
  //   return SpecialistState(searchOn: .)
  // }

  List<DoctorCard> test3 = [];

  // void Load() =>
  //     emit(SpecialistState(isSearchOn: true, test: test, test3: test3));

  void TurnSearchOn() => emit(
      SpecialistState(isSearchOn: true, test: state.test, test3: state.test3));

  void TurnSearchOff() => emit(
      SpecialistState(isSearchOn: false, test: state.test, test3: state.test3));

  void SearchFor(String item) {
    for (int i = 0; i < state.test.length; i++) {
      if (!state.test3.contains(testest.elementAt(i))) {
        if (state.test.elementAt(i).doctor_name.contains(item)) {
          state.test3.add(state.test.elementAt(i));
        }
      } else if (state.test3.contains(testest.elementAt(i))) {
        if (!state.test.elementAt(i).doctor_name.contains(item)) {
          state.test3.remove(state.test.elementAt(i));
        }
      }
    }
    emit(SpecialistState(
        isSearchOn: state.isSearchOn, test: state.test, test3: state.test3));
  }

  void SearchByFilter(String genre) {
    print("test");
    TurnSearchOn();
    ClearSearch();
    for (int i = 0; i < state.test.length; i++) {
      if (!state.test3.contains(testest.elementAt(i))) {
        if (state.test.elementAt(i).specialist_genres.contains(genre)) {
          state.test3.add(state.test.elementAt(i));
        }
      }
      // } else if (state.test3.contains(testest.elementAt(i))) {
      //   if (!state.test.elementAt(i).specialist_genres.contains(genre)) {
      //     state.test3.remove(state.test.elementAt(i));
      //   }
      // }
    }
    emit(SpecialistState(
        isSearchOn: state.isSearchOn, test: state.test, test3: state.test3));
    //TurnSearchOff();
  }

  void ClearSearch() {
    emit(SpecialistState(
        isSearchOn: state.isSearchOn, test: state.test, test3: []));
  }
}
