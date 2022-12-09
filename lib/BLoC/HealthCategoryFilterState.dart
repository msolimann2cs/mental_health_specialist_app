part of 'HealthCategoryFilterCubit.dart';

class HealthCategoryState {
  HealthCategoryState({
    required this.test2,
    //required this.clicked,
  });
  List<HealthCategoryFilter> test2;
  //bool clicked = false;

  HealthCategoryState copyWith({
    required List<HealthCategoryFilter> test3,
  }) {
    return HealthCategoryState(
      test2: test3,
    );
  }

  //@override
  //List<Object?> get props => [test2];
}
