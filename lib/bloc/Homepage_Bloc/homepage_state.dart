part of 'homepage_bloc.dart';

@immutable
abstract class HomepageState {}

class HomepageInitial extends HomepageState {}

class HomepageLoaded extends HomepageState {
  final List<HomePageMode> animals;

  HomepageLoaded(this.animals);
}
