import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'health_category_filter.dart';

part 'health_category_filter_state.dart';

final List<HealthCategoryFilter> testest2 = [
  HealthCategoryFilter(
    type: 'All',
    clicked: true,
  ),
  HealthCategoryFilter(
    type: 'Stress',
    clicked: false,
  ),
  HealthCategoryFilter(
    type: 'Anxiety',
    clicked: false,
  ),
  HealthCategoryFilter(
    type: 'Family Grief',
    clicked: false,
  ),
  HealthCategoryFilter(
    type: 'Depression',
    clicked: false,
  ),
];

List<HealthCategoryFilter> testest3 = [
  HealthCategoryFilter(
    type: 'All',
    clicked: true,
  ),
  HealthCategoryFilter(
    type: 'Stress',
    clicked: false,
  ),
  HealthCategoryFilter(
    type: 'Anxiety',
    clicked: false,
  ),
  HealthCategoryFilter(
    type: 'Family Grief',
    clicked: false,
  ),
  HealthCategoryFilter(
    type: 'Depression',
    clicked: false,
  ),
];

class HealthCategoryCubit extends Cubit<HealthCategoryState> {
  HealthCategoryCubit() : super(HealthCategoryState(test2: testest2));

  void SwitchFocus(String type) {
    int index = 0;
    for (int i = 0; i < testest3.length; i++) {
      testest3.elementAt(i).clicked = false;
      //testest3.add(testest2.elementAt(i));
      if (testest3.elementAt(i).type == type) {
        index = i;
        //print("object");
        testest3.elementAt(i).clicked = true;
        //testest3.elementAt(i).type = "xD";
        //testest3.add(testest2.elementAt(i));
      }
    }
    var temp = testest2.elementAt(testest2.length - 1);
    //testest2.remove(temp);
    List<HealthCategoryFilter> temp_list = [];
    //temp_list = testest3;
    for (int i = 0; i < testest3.length; i++) {
      HealthCategoryFilter temp_item = new HealthCategoryFilter(
          type: testest3.elementAt(i).type,
          clicked: testest3.elementAt(i).clicked);
      // temp_item.type = testest3.elementAt(i).type;
      // temp_item.clicked = false;
      temp_list.add(temp_item);
    }
    //temp_list.add(temp);
    // if (state.test2 == temp_list) {
    //   print("true");
    // } else {
    //   print("false");
    // }
    // for (int i = 0; i < state.test2.length; i++) {
    //   print(state.test2.elementAt(i));
    // }
    // for (int i = 0; i < testest3.length; i++) {
    //   print(testest3.elementAt(i));
    // }
    emit(state.copyWith(test3: temp_list));
    //temp_list.add(testest3.elementAt(testest3.length - 1));
    //emit(state.copyWith(test3: temp_list));

    //emit(HealthCategoryState(test2: testest2));
    //testest2.add(temp);
    // emit(HealthCategoryState(
    //     test2: testest2, clicked: testest2.elementAt(index).clicked));
  }

  void FocusOnAll() {
    for (int i = 0; i < testest3.length; i++) {
      testest3.elementAt(i).clicked = false;
      if (testest3.elementAt(i).type == "All") {
        testest3.elementAt(i).clicked = true;
      }
    }
    var temp = testest2.elementAt(testest2.length - 1);
    List<HealthCategoryFilter> temp_list = [];
    for (int i = 0; i < testest3.length; i++) {
      HealthCategoryFilter temp_item = new HealthCategoryFilter(
          type: testest3.elementAt(i).type,
          clicked: testest3.elementAt(i).clicked);
      temp_list.add(temp_item);
    }
    emit(state.copyWith(test3: temp_list));
  }

  String? FilterSpecialists() {
    String genre;
    for (int i = 0; i < state.test2.length; i++) {
      if (state.test2.elementAt(i).clicked) {
        genre = state.test2.elementAt(i).type;
        return genre;
      }
    }
    return null;
  }
}
