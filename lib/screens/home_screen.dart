import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_ui.dart';

import '../models/cubit_state.dart';
import '../models/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..fetchData(),
      child: const Scaffold(
        body: HomeScreenBuilder(),
      ),
    );
  }
}

class HomeScreenBuilder extends StatelessWidget {
  const HomeScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state == HomeState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state == HomeState.loaded) {
          return const HomeScreenUi();
        } else {
          return const Center(child: Text("Error fetching data"));
        }
      },
    );
  }
}
