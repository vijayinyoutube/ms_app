import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Models/homepage_model.dart';
import '../../Data/Repository/home_page_repo.dart';
import '../../bloc/Dashboard_Bloc/dashboard_bloc.dart';
import '../../bloc/Homepage_Bloc/homepage_bloc.dart';
import '../Screens/dashboard_page.dart';
import '../Screens/home_page.dart';

class RouteGenerator {
  final HomepageBloc _homePageBloc = HomepageBloc(HomePageRepo());
  final DashboardBloc _dashboardBloc = DashboardBloc();

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomepageBloc>.value(
            value: _homePageBloc,
            child: const HomePage(),
          ),
        );

      case '/dashboard':
        final arg = settings.arguments as List<HomePageMode>;
        if (arg.isNotEmpty) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider<DashboardBloc>.value(
              value: _dashboardBloc,
              child: DashboardPage(
                animals: arg,
              ),
            ),
          );
        } else {
          return _errorRoute();
        }

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
