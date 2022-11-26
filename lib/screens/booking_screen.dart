import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/components/doctor_card.dart';

import '../components/bottom_navbar.dart';
import '../components/health_category_filter_cubit.dart';
import '../components/specialist_cubit.dart';

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
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SpecialistCubit()),
        BlocProvider(create: (context) => HealthCategoryCubit())
      ],
      child: Scaffold(
        body: SafeArea(
          child: Container(
              color: Colors.white,
              child: BlocBuilder<SpecialistCubit, SpecialistState>(
                  builder: (context, state) {
                return Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "<",
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 113.0, top: 4),
                            child: Text(
                              "Specialist",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                            child: Text(
                              'November 2022',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    color: false
                                        ? Colors.blueAccent
                                        : Colors.blue[50],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Mon",
                                          style: (TextStyle(
                                              color: false
                                                  ? Colors.white
                                                  : Colors.blue,
                                              fontWeight: FontWeight.w500)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13.0),
                                          child: Text(
                                            "21",
                                            style: (TextStyle(
                                                color: false
                                                    ? Colors.white
                                                    : Colors.blue,
                                                fontWeight: FontWeight.w500)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    color: false
                                        ? Colors.blueAccent
                                        : Colors.blue[50],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Tue",
                                          style: (TextStyle(
                                              color: false
                                                  ? Colors.white
                                                  : Colors.blue,
                                              fontWeight: FontWeight.w500)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13.0),
                                          child: Text(
                                            "22",
                                            style: (TextStyle(
                                                color: false
                                                    ? Colors.white
                                                    : Colors.blue,
                                                fontWeight: FontWeight.w500)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    color: true
                                        ? Colors.blueAccent
                                        : Colors.blue[50],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Wed",
                                          style: (TextStyle(
                                              color: true
                                                  ? Colors.white
                                                  : Colors.blue,
                                              fontWeight: FontWeight.w500)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13.0),
                                          child: Text(
                                            "23",
                                            style: (TextStyle(
                                                color: true
                                                    ? Colors.white
                                                    : Colors.blue,
                                                fontWeight: FontWeight.w500)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    color: false
                                        ? Colors.blueAccent
                                        : Colors.blue[50],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Thu",
                                          style: (TextStyle(
                                              color: false
                                                  ? Colors.white
                                                  : Colors.blue,
                                              fontWeight: FontWeight.w500)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 13.0),
                                          child: Text(
                                            "24",
                                            style: (TextStyle(
                                                color: false
                                                    ? Colors.white
                                                    : Colors.blue,
                                                fontWeight: FontWeight.w500)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
                            child: Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: true
                                        ? Colors.blueAccent
                                        : Colors.blue[50],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "10:00",
                                      style: (TextStyle(
                                          color:
                                              true ? Colors.white : Colors.blue,
                                          fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: false
                                        ? Colors.blueAccent
                                        : Colors.blue[50],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "11:00",
                                      style: (TextStyle(
                                          color: false
                                              ? Colors.white
                                              : Colors.blue,
                                          fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: false
                                        ? Colors.blueAccent
                                        : Colors.blue[50],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "12:00",
                                      style: (TextStyle(
                                          color: false
                                              ? Colors.white
                                              : Colors.blue,
                                          fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: false
                                        ? Colors.blueAccent
                                        : Colors.blue[50],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "1:00",
                                      style: (TextStyle(
                                          color: false
                                              ? Colors.white
                                              : Colors.blue,
                                          fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: false
                                        ? Colors.blueAccent
                                        : Colors.blue[50],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "2:00",
                                      style: (TextStyle(
                                          color: false
                                              ? Colors.white
                                              : Colors.blue,
                                          fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 35, top: 25.0, bottom: 17),
                            child: Container(
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                color:
                                    true ? Colors.blueAccent : Colors.blue[50],
                                border: Border.all(color: Colors.white),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Confirm",
                                  style: (TextStyle(
                                      fontSize: 18,
                                      color: true ? Colors.white : Colors.blue,
                                      fontWeight: FontWeight.w500)),
                                ),
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
      ),
    );
  }
}

//BlocProvider.of<SpecialistCubit>(context).Specialist(args)
