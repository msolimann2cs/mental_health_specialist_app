import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../BLoC/BookingScreenCubit.dart';

class BookingDayCard extends StatefulWidget {
  BookingDayCard({
    super.key,
    required this.dayName,
    required this.dayDate,
    required this.isClicked,
  });
  String dayName;
  String dayDate;
  bool isClicked = false;
  @override
  State<BookingDayCard> createState() => _BookingDayCardState();
}

class _BookingDayCardState extends State<BookingDayCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BookingScreenCubit()),
        ],
        child: GestureDetector(
          onTap: () {
            BlocProvider.of<BookingScreenCubit>(context)
                .SwitchFocusBookingDay(widget.dayName);
          },
          child: BlocBuilder<BookingScreenCubit, BookingScreenState>(
              builder: (context, state) {
            return Container(
              width: 80,
              height: 110,
              decoration: BoxDecoration(
                color: widget.isClicked ? Colors.blueAccent : Colors.blue[50],
                border: Border.all(color: Colors.white),
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.dayName,
                      style: (TextStyle(
                          color: widget.isClicked ? Colors.white : Colors.blue,
                          fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 13.0),
                      child: Text(
                        widget.dayDate,
                        style: (TextStyle(
                            color:
                                widget.isClicked ? Colors.white : Colors.blue,
                            fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
