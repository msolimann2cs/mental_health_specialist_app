import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BLoC/HealthCategoryFilterCubit.dart';
import '../BLoC/SpecialistCubit.dart';


class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String textFieldVal = '';
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SpecialistCubit()),
        BlocProvider(create: (context) => HealthCategoryCubit())
      ],
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            children: [
              const Icon(
                Icons.search_outlined,
                size: 30,
                color: Colors.grey,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: TextEditingController(),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Search',
                      ),
                      onTap: () {
                        if (textFieldVal.isEmpty) {
                          BlocProvider.of<HealthCategoryCubit>(context)
                              .FocusOnAll();
                          // BlocProvider.of<SpecialistCubit>(context)
                          //     .TurnSearchOn();
                          BlocProvider.of<SpecialistCubit>(context)
                              .TurnSearchOff();
                          BlocProvider.of<SpecialistCubit>(context)
                              .ClearSearch();
                        } else {
                          BlocProvider.of<HealthCategoryCubit>(context)
                              .FocusOnAll();

                          BlocProvider.of<SpecialistCubit>(context)
                              .TurnSearchOn();
                          BlocProvider.of<SpecialistCubit>(context)
                              .SearchFor(textFieldVal);
                        }
                      },
                      onChanged: (value) {
                        if (value.isEmpty) {
                          //BlocProvider.of<SpecialistCubit>(context).Load();
                          BlocProvider.of<SpecialistCubit>(context)
                              .TurnSearchOff();
                          BlocProvider.of<SpecialistCubit>(context)
                              .ClearSearch();
                        } else {
                          BlocProvider.of<SpecialistCubit>(context)
                              .TurnSearchOn();
                          BlocProvider.of<SpecialistCubit>(context)
                              .SearchFor(value);
                        }
                        textFieldVal = value;
                      },
                      onEditingComplete: () {
                        if (textFieldVal.isEmpty) {
                          //BlocProvider.of<SpecialistCubit>(context).Load();
                          BlocProvider.of<SpecialistCubit>(context)
                              .TurnSearchOff();
                          BlocProvider.of<SpecialistCubit>(context)
                              .ClearSearch();
                        }
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
