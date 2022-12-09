import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLoC/BookingScreenCubit.dart';

class BookingHourCard extends StatefulWidget {
  BookingHourCard({Key? key, required this.hour, required this.isClicked})
      : super(key: key);
  String hour;
  bool isClicked;

  @override
  State<BookingHourCard> createState() => _BookingHourCardState();
}

class _BookingHourCardState extends State<BookingHourCard> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BookingScreenCubit()),
      ],
      child: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: GestureDetector(
          onTap: () {
            BlocProvider.of<BookingScreenCubit>(context)
                .SwitchFocusBookingHour(widget.hour);
          },
          child: BlocBuilder<BookingScreenCubit, BookingScreenState>(
              builder: (context, snapshot) {
            return Container(
              width: 70,
              height: 35,
              decoration: BoxDecoration(
                color: widget.isClicked ? Colors.blueAccent : Colors.blue[50],
                border: Border.all(color: Colors.white),
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Center(
                child: Text(
                  widget.hour,
                  style: (TextStyle(
                      color: widget.isClicked ? Colors.white : Colors.blue,
                      fontWeight: FontWeight.w500)),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
