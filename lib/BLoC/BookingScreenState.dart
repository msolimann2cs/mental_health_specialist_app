part of 'BookingScreenCubit.dart';


class BookingScreenState extends Equatable {
  BookingScreenState({
    required this.specialistAvailableDays,
    required this.specialistAvailableTimes,
  });
  List<BookingDayCard> specialistAvailableDays;
  List<BookingHourCard> specialistAvailableTimes;

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
