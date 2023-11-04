import 'package:flutter/material.dart';

class CardColor{
  MaterialColor color(String pokemonType) {
    if (pokemonType == "Grass" || pokemonType == "Ground") {
      return Colors.green;
    } else if (pokemonType == "Fire" ||
        pokemonType == "Poison" ||
        pokemonType == "Dragon") {
      return Colors.red;
    } else if (pokemonType == "Water") {
      return Colors.blue;
    } else if (pokemonType == "Bug" || pokemonType == "Ghost") {
      return Colors.lightGreen;
    } else if (pokemonType == "Electric") {
      return Colors.amber;
    } else if (pokemonType == "Ice") {
      return Colors.cyan;
    } else if (pokemonType == "Rock") {
      return Colors.brown;
    } else if (pokemonType == "Fighting" || pokemonType == "Psychic") {
      return Colors.indigo;
    }
    return Colors.grey;
  }
}