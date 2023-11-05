import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokimon/card_color.dart';
import 'package:pokimon/detials_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String apiLink =
  //     "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  List pokemon = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      fetchData();
    }
  }

  void fetchData() {
    var url = Uri.https("raw.githubusercontent.com",
        "Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((value) {
      // print(value.statusCode);
      if (value.statusCode == 200) {
        Map decodedData = jsonDecode(value.body);
        // print(decodedData);
        pokemon = decodedData['pokemon'];
        setState(() {});
        // print(pokemon[20]);
      } else {
        // print("error");
      }
      // return pokemon;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    CardColor color = CardColor();
    return Scaffold(
      body: Stack(children: [
        // background image
        Positioned(
            top: -60,
            right: -60,
            child: Image.asset(
              "assets/pokemon2.png",
              color: Colors.grey.shade900,
              width: 250,
            )),

        //favorite icon
        Positioned(
            top: 55,
            right: 53,
            child: GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (_)=>FavoriteScreen(pokemons: pokemon)));
              },
              child: const Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            )),

        const Positioned(
            top: 40,
            left: 20,
            // right: -60,
            child: Text(
              "pokemon",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),

        //grid view tiles
        Positioned(
          top: 100,
          bottom: 0,
          width: width,
          child: Column(
            children: [
              pokemon.isNotEmpty
                  ? Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 1.4),
                          itemCount: pokemon.length,
                          itemBuilder: (context, index) {
                            var type = pokemon[index]["type"][0];
                            // var type2 = pokemon[index]["type"][1];
                            return GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: color.color(type),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Stack(children: [
                                    Positioned(
                                      right: -20,
                                      bottom: -25,
                                      child: Opacity(
                                          opacity: .2,
                                          child: Image.asset(
                                              "assets/pokemon.png",
                                              height: 120)),
                                    ),

                                    // name position
                                    Positioned(
                                        top: 20,
                                        left: 10,
                                        child: Text(
                                          pokemon[index]["name"],
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800),
                                        )),

                                    // position of type
                                    Positioned(
                                        top: 50,
                                        left: 10,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(.3),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.white)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 8),
                                            child: Text(
                                              type.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )),

                                    // position of pokemon image
                                    Positioned(
                                      right: 10,
                                      bottom: 0,
                                      child: Hero(
                                        tag: index,
                                        child: CachedNetworkImage(
                                          imageUrl: pokemon[index]['img'],
                                          width: 110,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                              onTap: () {
                                // print("object");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => DetailsScreen(
                                              pokemon: pokemon[index],
                                              // heroTag: index,
                                              color: color.color(type),
                                              heroTag: index,
                                            )));
                              },
                            );
                          }),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ],
          ),
        ),
      ]),
    );
  }
}
