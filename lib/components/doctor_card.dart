import 'package:flutter/material.dart';

import '../screens/booking_screen.dart';

class DoctorCard extends StatelessWidget {
  DoctorCard({
    super.key,
    required this.doctor_type,
    required this.doctor_name,
    required this.image,
    required this.specialist_genres,
  });
  final String doctor_type;
  final String doctor_name;
  final NetworkImage image;
  List<String> specialist_genres = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //print("object");
        //Navigator.push(context, )
        Navigator.pushNamed(context, BookingScreen.id, arguments: doctor_name);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200),
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
                      image: image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 37.0, left: 20),
                child: Container(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor_name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          doctor_type,
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
                padding: const EdgeInsets.only(top: 50.0, left: 40),
                child: Icon(
                  Icons.phone_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
