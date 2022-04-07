import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/Homepage_Bloc/homepage_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomepageBloc, HomepageState>(
        listener: (context, state) {
          if (state is HomepageLoaded) {
            Navigator.of(context)
                .pushNamed('/dashboard', arguments: state.animals);
          }
        },
        builder: (context, state) {
          if (state is HomepageInitial) {
            return buildInitialLayout(context);
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget buildInitialLayout(BuildContext context) => Center(
        child: ElevatedButton(
            onPressed: () =>
                BlocProvider.of<HomepageBloc>(context).add(HomepageGetData()),
            child: const Text("GetData")),
      );
}
