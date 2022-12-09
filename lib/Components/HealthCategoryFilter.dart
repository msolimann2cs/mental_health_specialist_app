import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health/BLoC/SpecialistCubit.dart';

import '../BLoC/HealthCategoryFilterCubit.dart';

class HealthCategoryFilter extends StatefulWidget {
  //const HealthCategoryFilter({Key? key}) : super(key: key);
  HealthCategoryFilter({
    super.key,
    required this.type,
    required this.clicked,
  });
  String type;
  bool clicked;
  @override
  State<HealthCategoryFilter> createState() => _HealthCategoryFilterState();
}

// class _HealthCategoryFilterState extends State<HealthCategoryFilter> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class _HealthCategoryFilterState extends State<HealthCategoryFilter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SpecialistCubit()),
          BlocProvider(create: (context) => HealthCategoryCubit())
        ],
        //BlocProvider<HealthCategoryCubit>(
        //create: (context) => HealthCategoryCubit(),
        child: GestureDetector(
          onTap: () {
            BlocProvider.of<HealthCategoryCubit>(context)
                .SwitchFocus(widget.type);
            // String? genre = BlocProvider.of<HealthCategoryCubit>(context)
            //     .FilterSpecialists();
            BlocProvider.of<SpecialistCubit>(context)
                .SearchByFilter(widget.type);
          },
          child: BlocBuilder<HealthCategoryCubit, HealthCategoryState>(
              builder: (context, state) {
            return Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                color: widget.clicked ? Colors.blueAccent : Colors.blue[50],
                border: Border.all(color: Colors.white),
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Center(
                child: Text(
                  widget.type,
                  style: (TextStyle(
                      color: widget.clicked ? Colors.white : Colors.blue,
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
