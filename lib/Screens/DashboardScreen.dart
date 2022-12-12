import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/BLoC/BookingScreenCubit.dart';
import 'package:mental_health/BLoC/DashboardScreenCubit.dart';

import '../BLoC/SpecialistCubit.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static String id = "dashboard_screen";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

// Future<void> temp_test() async {
//   QuerySnapshot all_appointments_snapshot = await firestore
//       .collection("users")
//       .doc("Mohamed A. Soliman")
//       .collection("appointments")
//       .get();
//   var all_appointments = all_appointments_snapshot.docs;
//   //var val = all_appointments_snapshot.docs.map((doc) => doc.data());
//   // print(val);
//   // print(val.elementAt(0)['dayName']);
//   //print(all_appointments.elementAt(index));
//   testest.clear();
//   for (int i = 0; i < all_appointments.length; i++) {
//     String dayName = all_appointments.elementAt(i)["dayName"];
//     String dayDate = all_appointments.elementAt(i)["dayDate"];
//     String dayHour = all_appointments.elementAt(i)["dayHour"];
//     String specialistName = all_appointments.elementAt(i)["specialist"];
//     String cost = all_appointments.elementAt(i)["cost"];
//     bool isDone = all_appointments.elementAt(i)["isDone"];
//
//     SpecialistCardTwo card = SpecialistCardTwo(
//         specialistName: specialistName,
//         dayName: dayName,
//         dayDate: dayDate,
//         dayHour: dayHour,
//         cost: cost,
//         isDone: isDone);
//     testest.add(card);
//     //testest.add(card);
//     print(all_appointments.elementAt(i).data());
//   }
// }

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    //temp_test();
    //BlocProvider.of<DashboardScreenCubit>(context).LoadAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var temp = BlocProvider.of<SpecialistCubit>(context).state.test;
    // for(int i = 0; i < temp.length; i++){
    //   if(temp.elementAt(i).image)
    //   temp.elementAt(i).image
    // }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: BlocBuilder<DashboardScreenCubit, DashboardScreenState>(
              builder: (context, state) {
            print(state.appointments);

            return ListView.builder(
              itemBuilder: (context, index) {
                return state.appointments[index];
              },
              itemCount: state.appointments.length,
              scrollDirection: Axis.vertical,
            );
          }),
        ),
      ),
    );
  }
}

class SpecialistCardTwo extends StatelessWidget {
  SpecialistCardTwo({
    super.key,
    required this.specialistName,
    required this.dayName,
    required this.dayDate,
    required this.dayHour,
    required this.cost,
    required this.image,
    required this.isDone,
  });
  String specialistName;
  String dayName;
  String dayDate;
  String dayHour;
  String cost;
  String image;
  bool isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10.0),
        child: Container(
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: isDone
                ? Border.all(color: Colors.grey.shade200)
                : Border.all(color: Colors.green),
            //color: Colors.grey.shade200
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 23.0, left: 20),
                child: Container(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        specialistName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          dayName + " " + dayDate,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          dayHour,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45.0, left: 40),
                child: Column(
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      size: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        "\$" + cost,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //color: Colors.white,
    );
  }
}
