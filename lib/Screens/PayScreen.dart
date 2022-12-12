import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/BLoC/BookingScreenCubit.dart';
import 'package:mental_health/BLoC/DashboardScreenCubit.dart';
import 'package:mental_health/BLoC/DataManagerCubit.dart';
import 'package:mental_health/Components/BookingDayCard.dart';
import 'package:mental_health/Components/BookingHourCard.dart';
import 'package:mental_health/Components/ButtonCard.dart';
import 'package:mental_health/Components/TopNavBar.dart';
import 'package:mental_health/BLoC/SpecialistCubit.dart';
import 'package:mental_health/Components/SpecialistCard.dart';
import 'package:mental_health/screens/HomeScreen.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({Key? key}) : super(key: key);
  static String id = "pay_screen";
  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: Container(
          //height: double.infinity,
          //color: Colors.red,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TopNavBar(title: "Payment"),
              Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Text(
                        "Card Number",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                      child: TextFieldCard(
                        hintText: "Card Details",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Text(
                        "Expiry Date",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFieldCard(
                              hintText: "month",
                            ),
                          ),
                        ),
                        Text(
                          "/",
                          style: TextStyle(fontSize: 30),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFieldCard(
                              hintText: "year",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Text(
                        "CVV Number",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                      child: TextFieldCard(
                        hintText: "CVV Number",
                      ),
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: ButtonCard(
                        buttonText: "Confirm",
                        func: () {
                          var test_temp =
                              BlocProvider.of<SpecialistCubit>(context)
                                  .state
                                  .test;
                          DoctorCard test_temp2 = new DoctorCard(
                              doctor_type: "",
                              doctor_name: "",
                              image: NetworkImage(""),
                              specialist_genres: [],
                              cost: "");
                          for (int i = 0; i < test_temp.length; i++) {
                            if (test_temp.elementAt(i).doctor_name == args) {
                              test_temp2 = test_temp.elementAt(i);
                            }
                          }
                          var test_temp_booking_days =
                              BlocProvider.of<BookingScreenCubit>(context)
                                  .getClickedDay();
                          var test_temp_booking_hours =
                              BlocProvider.of<BookingScreenCubit>(context)
                                  .getClickedHour();
                          BookingDayCard temp_day = new BookingDayCard(
                              dayName: "", dayDate: "", isClicked: false);
                          BookingHourCard temp_hour =
                              new BookingHourCard(hour: "", isClicked: false);
                          var bookingDayName = '';
                          var bookingDayDate = '';
                          var bookingDayHour = '';
                          print(test_temp_booking_days.dayName);

                          // for (int i = 0;
                          //     i < test_temp_booking_days.length;
                          //     i++) {
                          //   if (test_temp_booking_days.elementAt(i).isClicked) {
                          //     bookingDayName =
                          //         test_temp_booking_days.elementAt(i).dayName;
                          //     bookingDayDate =
                          //         test_temp_booking_days.elementAt(i).dayDate;
                          //   }
                          // }
                          // for (int i = 0;
                          //     i < test_temp_booking_hours.length;
                          //     i++) {
                          //   if (test_temp_booking_hours
                          //       .elementAt(i)
                          //       .isClicked) {
                          //     bookingDayHour =
                          //         test_temp_booking_hours.elementAt(i).hour;
                          //   }
                          // }
                          String userFullName =
                              BlocProvider.of<DataManagerCubit>(context)
                                  .state
                                  .loggedInUser;
                          firestore
                              .collection("users")
                              .doc(userFullName)
                              .collection("appointments")
                              .add({
                            "image": test_temp2.image.url,
                            "cost": test_temp2.cost,
                            "dayDate": test_temp_booking_days.dayDate,
                            "dayHour": test_temp_booking_hours,
                            "dayName": test_temp_booking_days.dayName,
                            "isDone": false,
                            "specialist": args,
                          });
                          print("test");
                          BlocProvider.of<DashboardScreenCubit>(context)
                              .LoadDashboard(userFullName);
                          Navigator.popUntil(
                              context, ModalRoute.withName(MainScreen.id));
                        },
                      ),
                    )),
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

class TextFieldCard extends StatelessWidget {
  TextFieldCard({
    super.key,
    required this.hintText,
  });
  String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
