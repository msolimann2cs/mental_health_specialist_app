import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/Screens/PayScreen.dart';
import 'package:mental_health/components/SpecialistCard.dart';

import '../BLoC/BookingScreenCubit.dart';
import '../BLoC/HealthCategoryFilterCubit.dart';
import '../BLoC/SpecialistCubit.dart';
import '../Components/ButtonCard.dart';
import '../components/BookingDayCard.dart';
import '../components/BookingHourCard.dart';
import '../components/TopNavBar.dart';
import '../components/BottomNavBar.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);
  // BookingScreen(
  //   this.name,
  // );
  static String id = "booking_screen";
  //String name;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  List<BookingDayCard> specialistAvailableDays = [];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: SafeArea(
        child: Container(
            color: Colors.white,
            child: BlocBuilder<SpecialistCubit, SpecialistState>(
                builder: (context, state) {
              return Column(
                children: [
                  TopNavBar(
                    title: "Specialist",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocProvider.of<SpecialistCubit>(context)
                            .Specialist(args),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                            onTap: () {
                              // BlocProvider.of<BookingScreenCubit>(context)
                              //     .LoadDaysFromDB(
                              //         args.substring(4, args.length));
                            },
                            child: Text(
                              'December 2022',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            width: 400,
                            height: 100,
                            child: BlocBuilder<BookingScreenCubit,
                                BookingScreenState>(builder: (context, state) {
                              return StreamBuilder(
                                stream: firestore
                                    .collection('specialists')
                                    .doc(args.substring(4, args.length))
                                    .collection('bookingDays')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  final test_arr = snapshot.data!.docs
                                      .map((doc) => doc.data())
                                      .toList();
                                  //print(test_arr);
                                  //print(test_arr[0]['bookingDays']);
                                  Map test_arr2 = test_arr[0]['bookingDays'];
                                  print(test_arr2);
                                  List test_arr3 = [];
                                  test_arr2.forEach((key, value) {
                                    test_arr3.add(value);
                                  });
                                  print(test_arr3);
                                  // .map((doc) => doc.data())
                                  // .toList();
                                  // test_arr.sort((a, b) {
                                  //   return (a['dayDate'])
                                  //       .compareTo(b['dayDate']);
                                  // });
                                  //print(test_arr);
                                  test_arr3.sort((a, b) {
                                    //test_arr[0]['bookingDays']['day1']
                                    return (a['dayDate'])
                                        .compareTo(b['dayDate']);
                                  });
                                  print(test_arr3);
                                  // print(test_arr2);
                                  //state.specialistAvailableDays.clear();
                                  for (int i = 0; i < test_arr3.length; i++) {
                                    BookingDayCard bookingDay = BookingDayCard(
                                      dayName: test_arr3[i]["dayName"],
                                      dayDate:
                                          test_arr3[i]["dayDate"].toString(),
                                      isClicked: false,
                                    );
                                    if (state.specialistAvailableDays.length <
                                        test_arr3.length) {
                                      state.specialistAvailableDays
                                          .add(bookingDay);
                                    }
                                  }
                                  return ListView.builder(
                                    itemBuilder: (context, index) {
                                      return state
                                          .specialistAvailableDays[index];
                                    },
                                    itemCount:
                                        state.specialistAvailableDays.length,
                                    scrollDirection: Axis.horizontal,
                                  );
                                },
                              );
                            }),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Visiting Hours',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30.0, left: 10, bottom: 10),
                          child: Container(
                            width: 400,
                            height: 35,
                            child: BlocBuilder<BookingScreenCubit,
                                BookingScreenState>(builder: (context, state) {
                              return StreamBuilder(
                                stream: firestore
                                    .collection('specialists')
                                    .doc(args.substring(4, args.length))
                                    .collection('bookingHours')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  final test_arr = snapshot.data!.docs
                                      .map((doc) => doc.data())
                                      .toList();
                                  //print(test_arr);
                                  //print(test_arr[0]['bookingDays']);
                                  Map test_arr2 = test_arr[0]['bookingHours'];
                                  print(test_arr2);
                                  List test_arr3 = [];
                                  test_arr2.forEach((key, value) {
                                    test_arr3.add(value);
                                  });
                                  print(test_arr3);
                                  // .map((doc) => doc.data())
                                  // .toList();
                                  // test_arr.sort((a, b) {
                                  //   return (a['dayDate'])
                                  //       .compareTo(b['dayDate']);
                                  // });
                                  //print(test_arr);
                                  test_arr3.sort((a, b) {
                                    //test_arr[0]['bookingDays']['day1']
                                    return (a['hour']).compareTo(b['hour']);
                                  });
                                  print(test_arr3);
                                  // print(test_arr2);
                                  //state.specialistAvailableDays.clear();
                                  for (int i = 0; i < test_arr3.length; i++) {
                                    BookingHourCard bookingDay =
                                        BookingHourCard(
                                      hour: test_arr3[i]["hour"],
                                      isClicked: false,
                                    );
                                    if (state.specialistAvailableTimes.length <
                                        test_arr3.length) {
                                      state.specialistAvailableTimes
                                          .add(bookingDay);
                                    }
                                  }
                                  return ListView.builder(
                                    itemBuilder: (context, index) {
                                      return state
                                          .specialistAvailableTimes[index];
                                    },
                                    itemCount:
                                        state.specialistAvailableTimes.length,
                                    scrollDirection: Axis.horizontal,
                                  );
                                },
                              );
                            }),
                          ),
                          // child: Row(
                          //   children: [
                          //     BookingHourCard(
                          //       hour: "10:00",
                          //       isClicked: false,
                          //     ),
                          //   ],
                          // ),
                        ),
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 25.0, bottom: 17),
                            child: ButtonCard(
                              buttonText: 'Confirm',
                              func: () {
                                Navigator.pushNamed(context, PayScreen.id,
                                    arguments: args);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //bt_navbar(),
                ],
              );
            })),
      ),
    );
  }
}
