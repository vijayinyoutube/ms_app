import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Models/homepage_model.dart';
import '../../bloc/Dashboard_Bloc/dashboard_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key, required this.animals}) : super(key: key);

  final List<HomePageMode> animals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DashboardBloc, DashboardState>(
        listener: (context, state) {},
        builder: (context, state) {
          return buildLoadedLayout(animals);
        },
      ),
    );
  }

  Widget buildLoadedLayout(List<HomePageMode> animals) => ListView.builder(
      itemCount: animals.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text(animals[index].type));
      });
}
