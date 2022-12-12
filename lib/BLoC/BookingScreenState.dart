part of 'BookingScreenCubit.dart';

class BookingScreenState extends Equatable {
  BookingScreenState({
    required this.specialistAvailableDays,
    required this.specialistAvailableTimes,
  });
  List<BookingDayCard> specialistAvailableDays = [
    BookingDayCard(dayName: "dayName", dayDate: "dayDate", isClicked: false)
  ];
  List<BookingHourCard> specialistAvailableTimes = [
    BookingHourCard(
      hour: "hour",
      isClicked: false,
    )
  ];

  BookingScreenState copyWith({
    required List<BookingDayCard> test3,
    required List<BookingHourCard> test4,
  }) {
    return BookingScreenState(
      specialistAvailableDays: test3,
      specialistAvailableTimes: test4,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [specialistAvailableDays, specialistAvailableTimes];
}
