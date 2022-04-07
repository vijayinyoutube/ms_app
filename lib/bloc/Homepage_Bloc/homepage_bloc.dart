import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Data/Models/homepage_model.dart';
import '../../Data/Repository/home_page_repo.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  final HomePageRepo homePageRepo;

  late List<HomePageMode> animals;

  HomepageBloc(this.homePageRepo) : super(HomepageInitial()) {
    on<HomepageEvent>((event, emit) async {
      if (event is HomepageGetData) {
        animals = await homePageRepo.fetchAnimalDetails();
        print(animals);
        emit(HomepageLoaded(animals));
      }
    });
  }
}
