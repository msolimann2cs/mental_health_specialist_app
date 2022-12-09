part of 'DashboardScreenCubit.dart';

class DashboardScreenState extends Equatable {
  DashboardScreenState({
    required this.appointments,
  });
  List<SpecialistCardTwo> appointments;

  DashboardScreenState copyWith({
    required List<SpecialistCardTwo> test3,
  }) {
    return DashboardScreenState(
      appointments: test3,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [appointments];
}
