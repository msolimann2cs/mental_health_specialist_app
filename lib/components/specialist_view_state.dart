part of 'specialist_cubit.dart';

class SpecialistState {
  bool isSearchOn;
  List<DoctorCard> test = [
    DoctorCard(
      doctor_name: "Dr. Mariam Kreig",
      doctor_type: "Clinical Psychologist",
      image: NetworkImage(
          "https://media.istockphoto.com/photos/portrait-of-smiling-mixed-race-woman-looking-at-camera-picture-id1319763830?k=20&m=1319763830&s=612x612&w=0&h=ooguDiiKrPmsnN4MKQ7S1pIfddwAqXnqF7XW4MF6gM8="),
      specialist_genres: ['All', 'Stress'],
    ),
    DoctorCard(
      doctor_name: "Dr. Donia Daniel",
      doctor_type: "Clinical Psychologist",
      image: NetworkImage(
          "https://media.istockphoto.com/photos/portrait-of-smiling-mixed-race-woman-looking-at-camera-picture-id1319763830?k=20&m=1319763830&s=612x612&w=0&h=ooguDiiKrPmsnN4MKQ7S1pIfddwAqXnqF7XW4MF6gM8="),
      specialist_genres: ['All', 'Stress', 'Anxiety'],
    ),
    DoctorCard(
      doctor_name: "Dr. Rana Tobias",
      doctor_type: "Clinical Psychologist",
      image: NetworkImage(
          "https://media.istockphoto.com/photos/portrait-of-smiling-mixed-race-woman-looking-at-camera-picture-id1319763830?k=20&m=1319763830&s=612x612&w=0&h=ooguDiiKrPmsnN4MKQ7S1pIfddwAqXnqF7XW4MF6gM8="),
      specialist_genres: ['All', 'Depression'],
    ),
    DoctorCard(
      doctor_name: "Dr. Amira Evan",
      doctor_type: "Clinical Psychologist",
      image: NetworkImage(
          "https://media.istockphoto.com/photos/portrait-of-smiling-mixed-race-woman-looking-at-camera-picture-id1319763830?k=20&m=1319763830&s=612x612&w=0&h=ooguDiiKrPmsnN4MKQ7S1pIfddwAqXnqF7XW4MF6gM8="),
      specialist_genres: ['All', 'Family Grief'],
    ),
  ];

  List<DoctorCard> test3 = [];

  SpecialistState({
    required this.isSearchOn,
    required this.test,
    required this.test3,
  });
}
