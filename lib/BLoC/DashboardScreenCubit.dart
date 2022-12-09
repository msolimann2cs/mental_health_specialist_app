import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Screens/DashboardScreen.dart';
import 'BookingScreenCubit.dart';

part 'DashboardScreenState.dart';

List<SpecialistCardTwo> appointments_two = [];

class DashboardScreenCubit extends Cubit<DashboardScreenState> {
  DashboardScreenCubit() : super(DashboardScreenState(appointments: [])) {}

  Future<void> LoadDashboard() async {
    QuerySnapshot all_appointments_snapshot = await firestore
        .collection("users")
        .doc("Mohamed A. Soliman")
        .collection("appointments")
        .get();
    var all_appointments = all_appointments_snapshot.docs;
    //var val = all_appointments_snapshot.docs.map((doc) => doc.data());
    // print(val);
    // print(val.elementAt(0)['dayName']);
    //print(all_appointments.elementAt(index));
    appointments_two.clear();
    for (int i = 0; i < all_appointments.length; i++) {
      String dayName = all_appointments.elementAt(i)["dayName"];
      String dayDate = all_appointments.elementAt(i)["dayDate"];
      String dayHour = all_appointments.elementAt(i)["dayHour"];
      String specialistName = all_appointments.elementAt(i)["specialist"];
      String cost = all_appointments.elementAt(i)["cost"];
      bool isDone = all_appointments.elementAt(i)["isDone"];

      SpecialistCardTwo card = SpecialistCardTwo(
          specialistName: specialistName,
          dayName: dayName,
          dayDate: dayDate,
          dayHour: dayHour,
          cost: cost,
          isDone: isDone);
      appointments_two.add(card);
      //testest.add(card);
      //print(all_appointments.elementAt(i).data());
      print(appointments_two);

      //LoadAppointments();
    }
    await Future<void>.delayed(const Duration(milliseconds: 50));
    emit(state.copyWith(test3: appointments_two));
  }

  // void LoadAppointments() {
  //   emit(DashboardScreenState(appointments: appointments_two));
  //   print(state.appointments);
  // }
}
