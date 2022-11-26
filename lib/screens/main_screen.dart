import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/components/health_category_filter_cubit.dart';
import 'package:mental_health/screens/booking_screen.dart';

import '../components/specialist_cubit.dart';
import '../components/bottom_navbar.dart';
import '../components/doctor_card.dart';
import '../components/health_category_filter.dart';
import '../components/search_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static String id = "main_screen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //bool searchOn = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SpecialistCubit()),
        BlocProvider(create: (context) => HealthCategoryCubit())
      ],
      //create: (context) => SpecialistCubit(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: const Text(
                              "Find your desired specialist",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          //Search bar
                          const Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, left: 10, right: 10, bottom: 10),
                            child: SearchBar(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, bottom: 10),
                            child: SizedBox(
                              width: 400,
                              height: 45,
                              child: BlocBuilder<HealthCategoryCubit,
                                      HealthCategoryState>(
                                  builder: (context, state) {
                                return ListView.builder(
                                  itemBuilder: (context, index) {
                                    return state.test2[index];
                                  },
                                  itemCount: state.test2.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                );
                              }),
                            ),
                          ),
                          Expanded(
                            child:
                                BlocBuilder<SpecialistCubit, SpecialistState>(
                                    builder: (context, state) {
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  return state.isSearchOn
                                      ? state.test3[index]
                                      : state.test[index];
                                },
                                itemCount: state.isSearchOn
                                    ? state.test3.length
                                    : state.test.length,
                                //scrollDirection: Axis.vertical,
                                //shrinkWrap: true,
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const bt_navbar(),
                ],
              ),
            ),
          )),
    );
  }
}
