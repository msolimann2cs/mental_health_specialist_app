import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import '../Components/SpecialistCard.dart';

part 'SpecialistViewState.dart';

List<DoctorCard> testest = [
  DoctorCard(
    doctor_name: "Dr. Maram Tolba",
    doctor_type: "Clinical Psychologist",
    cost: "35",
    image: NetworkImage(
        "https://i.gyazo.com/9280b52b49dacf4d11d273ece2ea510d.png"),
    specialist_genres: ['All', 'Stress'],
  ),
  DoctorCard(
    doctor_name: "Dr. Yasmine Magdy",
    doctor_type: "Clinical Psychologist",
    cost: "35",
    image: NetworkImage(
        "https://scontent.fcai19-7.fna.fbcdn.net/v/t1.6435-9/70660023_2377227735857045_4552345938517032960_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=9267fe&_nc_ohc=9Q_Ahbkv4IAAX_jzkQv&_nc_ht=scontent.fcai19-7.fna&oh=00_AfCecndKzzvjFnFGEewBmU64URUaQIzAfLPxnlE1jcYT3A&oe=63A8D0BE"),
    specialist_genres: ['All', 'Stress', 'Anxiety'],
  ),
  DoctorCard(
    doctor_name: "Dr. Mariam Zaki",
    doctor_type: "Clinical Psychologist",
    cost: "35",
    image: NetworkImage(
        "https://scontent.fcai19-7.fna.fbcdn.net/v/t1.6435-9/54346728_2327227827509601_9144765489568808960_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=0debeb&_nc_ohc=Wzy2PAJ94jYAX_xEYcL&_nc_ht=scontent.fcai19-7.fna&oh=00_AfAAYTMY6dBl0S7ES2JMyT4d0mFYHfmGOHo-K6wWBUYK3Q&oe=63A8DF5B"),
    specialist_genres: ['All', 'Family Grief'],
  ),
  DoctorCard(
    doctor_name: "Dr. Salma Tarek",
    doctor_type: "Clinical Psychologist",
    cost: "35",
    image: NetworkImage(
        "https://i.gyazo.com/8a5b5e7b4a28398507316a2e76f7ba2a.jpg"),
    specialist_genres: ['All', 'Depression'],
  ),
];

class SpecialistCubit extends Cubit<SpecialistState> {
  SpecialistCubit()
      : super(SpecialistState(isSearchOn: false, test: testest, test3: []));

  // bool searchType(){
  //   return SpecialistState(searchOn: .)
  // }

  List<DoctorCard> test3 = [];

  // void Load() =>
  //     emit(SpecialistState(isSearchOn: true, test: test, test3: test3));

  void TurnSearchOn() => emit(
      SpecialistState(isSearchOn: true, test: state.test, test3: state.test3));

  void TurnSearchOff() => emit(
      SpecialistState(isSearchOn: false, test: state.test, test3: state.test3));

  void SearchFor(String item) {
    for (int i = 0; i < state.test.length; i++) {
      if (!state.test3.contains(testest.elementAt(i))) {
        if (state.test.elementAt(i).doctor_name.contains(item)) {
          state.test3.add(state.test.elementAt(i));
        }
      } else if (state.test3.contains(testest.elementAt(i))) {
        if (!state.test.elementAt(i).doctor_name.contains(item)) {
          state.test3.remove(state.test.elementAt(i));
        }
      }
    }
    emit(SpecialistState(
        isSearchOn: state.isSearchOn, test: state.test, test3: state.test3));
  }

  void SearchByFilter(String genre) {
    print("test");
    TurnSearchOn();
    ClearSearch();
    for (int i = 0; i < state.test.length; i++) {
      if (!state.test3.contains(testest.elementAt(i))) {
        if (state.test.elementAt(i).specialist_genres.contains(genre)) {
          state.test3.add(state.test.elementAt(i));
        }
      }
      // } else if (state.test3.contains(testest.elementAt(i))) {
      //   if (!state.test.elementAt(i).specialist_genres.contains(genre)) {
      //     state.test3.remove(state.test.elementAt(i));
      //   }
      // }
    }
    emit(SpecialistState(
        isSearchOn: state.isSearchOn, test: state.test, test3: state.test3));
    //TurnSearchOff();
  }

  void ClearSearch() {
    emit(SpecialistState(
        isSearchOn: state.isSearchOn, test: state.test, test3: []));
  }

  Widget Specialist(String name) {
    for (int i = 0; i < testest.length; i++) {
      if (testest.elementAt(i).doctor_name == name) {
        String dr_name = testest.elementAt(i).doctor_name;
        String dr_type = testest.elementAt(i).doctor_type;
        NetworkImage dr_image = testest.elementAt(i).image;
        List<String> dr_genres = testest.elementAt(i).specialist_genres;
        Widget test = DoctorCardNew(
            doctor_type: dr_name,
            doctor_name: dr_type,
            image: dr_image,
            specialist_genres: dr_genres);
        return test;
      }
    }
    return testest.elementAt(0);
  }
}

class DoctorCardNew extends StatelessWidget {
  DoctorCardNew({
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
        //Navigator.pushNamed(context, BookingScreen.id, arguments: doctor_name);
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
