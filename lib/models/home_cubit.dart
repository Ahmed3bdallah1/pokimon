import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'cubit_state.dart';
import 'package:http/http.dart' as http;

class HomeCubit extends Cubit<HomeState> {
  final List<Map<String, dynamic>> pokemon = [];

  HomeCubit() : super(HomeState.initial);

  void fetchData() async {
    emit(HomeState.loading);

    try {
      final url = Uri.https(
        "raw.githubusercontent.com",
        "Biuni/PokemonGO-Pokedex/master/pokedex.json",
      );
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        pokemon.addAll(decodedData['pokemon']);
        emit(HomeState.loaded);
      } else {
        emit(HomeState.error);
      }
    } catch (e) {
      emit(HomeState.error);
    }
  }
}