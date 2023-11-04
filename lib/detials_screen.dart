import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class DetailsScreen extends StatefulWidget {
  final Map<String, dynamic> pokemon;
  final int heroTag;
  final Color color;

  const DetailsScreen(
      {super.key,
      required this.pokemon,
      required this.color,
      required this.heroTag});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  bool isTapped=false;

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List type = widget.pokemon["type"];
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        children: [
          // position of back button
          Positioned(
              top: width * .03,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white))),

          //position of pokemon name
          Positioned(
              top: width * .16,
              left: 20,
              child: Text(
                widget.pokemon["name"],
                style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),

          //position of pokemon type
          Positioned(
              top: width * .26,
              left: 20,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.3),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 6, right: 6, top: 2, bottom: 2),
                      child: Text(
                        widget.pokemon["type"][0],
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  type.length == 2
                      ? Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.3),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 6, right: 6, top: 2, bottom: 2),
                            child: Text(
                              widget.pokemon["type"][1],
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ))
                      : const Text(" "),
                ],
              )),

          //position of the background Image
          Positioned(
            right: -width * .16,
            top: width * .14,
            width: width * .7,
            child:
                Opacity(opacity: .4, child: Image.asset("assets/pokemon.png")),
          ),

          //favorite icon
          Positioned(
              top: 30,
              right: 20,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    isTapped= !isTapped;
                    print(isTapped.toString());
                  });
                },
                  child: isTapped==false
                      ? const Icon(Icons.favorite_border)
                      : const Icon(Icons.favorite))),

          //position of pokemon number
          Positioned(
              top: width * .2,
              right: 20,
              child: Text(
                "#${widget.pokemon["num"]}",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),

          //position of the container
          Positioned(
            bottom: 0,
            // left: 5,
            // right: 10,
            child: Container(
              height: height * .6,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  border: Border.all(color: Colors.grey)),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 28.0, left: 8, right: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.3),
                          borderRadius: BorderRadius.circular(12)),
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            color: widget.color.withOpacity(.2),
                            borderRadius: BorderRadius.circular(12)),
                        controller: tabController,
                        // isScrollable: true,
                        tabs: [
                          Tab(
                            child: SizedBox(
                              width: width * .5,
                              child: const Center(child: Text("About")),
                            ),
                          ),
                          Tab(
                            child: SizedBox(
                              width: width * .5,
                              child: const Center(child: Text("general")),
                            ),
                          ),
                          Tab(
                            child: SizedBox(
                              width: width * .5,
                              child: const Center(child: Text("evolution")),
                            ),
                          ),
                          Tab(
                            child: SizedBox(
                              width: width * .5,
                              child: const Center(child: Text("Moves")),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * .35,
                    width: width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          ListView(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("Name"),
                                          SizedBox(height: 10),
                                          Text("height"),
                                          SizedBox(height: 10),
                                          Text("weight"),
                                          SizedBox(height: 10),
                                          Text("candy"),
                                          SizedBox(height: 10),
                                          Text("candy count"),
                                          SizedBox(height: 10),
                                          Text("egg weight")
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.pokemon["name"],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            widget.pokemon["height"],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            widget.pokemon["weight"],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            widget.pokemon["candy"],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            widget.pokemon["candy_count"]
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            widget.pokemon["egg"].toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      const Column(
                                          children: [SizedBox(width: 30)])
                                    ],
                                  )
                                ],
                                // children: [
                                //   Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceAround,
                                //     children: [
                                //       const Text("Name"),
                                //       Text(
                                //         widget.pokemon["name"],
                                //         style: const TextStyle(
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: 18),
                                //       ),
                                //       const SizedBox(width: 30)
                                //     ],
                                //   ),
                                //   const SizedBox(height: 10),
                                //   Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceAround,
                                //     children: [
                                //       const Text("height"),
                                //       Text(
                                //         widget.pokemon["height"],
                                //         style: const TextStyle(
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: 18),
                                //       ),
                                //       const SizedBox(width: 30)
                                //     ],
                                //   ),
                                //   const SizedBox(height: 10),
                                //   Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceAround,
                                //     children: [
                                //       const Text("weight"),
                                //       Text(
                                //         widget.pokemon["weight"],
                                //         style: const TextStyle(
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: 18),
                                //       ),
                                //       const SizedBox(width: 30)
                                //     ],
                                //   ),
                                //   const SizedBox(height: 10),
                                //   Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceAround,
                                //     children: [
                                //       const Text("candy"),
                                //       Text(
                                //         widget.pokemon["candy"],
                                //         style: const TextStyle(
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: 18),
                                //       ),
                                //       const SizedBox(width: 30)
                                //     ],
                                //   ),
                                //   const SizedBox(height: 10),
                                //   Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceAround,
                                //     children: [
                                //       const Text("candy count"),
                                //       Text(
                                //         widget.pokemon["candy_count"]
                                //             .toString(),
                                //         style: const TextStyle(
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: 18),
                                //       ),
                                //       const SizedBox(width: 30)
                                //     ],
                                //   ),
                                //   const SizedBox(height: 10),
                                //   Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceAround,
                                //     children: [
                                //       const Text("egg weight"),
                                //       Text(
                                //         widget.pokemon["egg"].toString(),
                                //         style: const TextStyle(
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: 18),
                                //       ),
                                //       const SizedBox(width: 30)
                                //     ],
                                //   ),
                                // ],
                              )
                            ],
                          ),
                          ListView(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("spawn chance"),
                                          SizedBox(height: 10),
                                          Text("avg_spawns"),
                                          SizedBox(height: 10),
                                          Text("spawn time"),
                                          SizedBox(height: 10),
                                          Text("multiplier"),
                                          SizedBox(height: 10),
                                          Text("weakness"),
                                          // SizedBox(height: 10),
                                          // Text("egg weight")
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.pokemon["spawn_chance"]
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            widget.pokemon["avg_spawns"]
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            widget.pokemon["spawn_time"]
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            widget.pokemon["multipliers"]
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            widget.pokemon["weaknesses"]
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          // Text(
                                          //   widget.pokemon["egg"].toString(),
                                          //   style: const TextStyle(
                                          //       fontWeight: FontWeight.bold,
                                          //       fontSize: 18),
                                          // ),
                                        ],
                                      ),
                                      const Column(
                                          children: [SizedBox(width: 30)])
                                    ],
                                  )
                                ],
                                // children: [
                                //   Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceAround,
                                //     children: [
                                //       const Text("Name"),
                                //       Text(
                                //         widget.pokemon["name"],
                                //         style: const TextStyle(
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: 18),
                                //       ),
                                //       const SizedBox(width: 30)
                                //     ],
                                //   ),
                                //   const SizedBox(height: 10),
                                //   Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceAround,
                                //     children: [
                                //       const Text("height"),
                                //       Text(
                                //         widget.pokemon["height"],
                                //         style: const TextStyle(
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: 18),
                                //       ),
                                //       const SizedBox(width: 30)
                                //     ],
                                //   ),
                                //   const SizedBox(height: 10),
                                //   Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceAround,
                                //     children: [
                                //       const Text("weight"),
                                //       Text(
                                //         widget.pokemon["weight"],
                                //         style: const TextStyle(
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: 18),
                                //       ),
                                //       const SizedBox(width: 30)
                                //     ],
                                //   ),
                                //   const SizedBox(height: 10),
                                //   Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceAround,
                                //     children: [
                                //       const Text("candy"),
                                //       Text(
                                //         widget.pokemon["candy"],
                                //         style: const TextStyle(
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: 18),
                                //       ),
                                //       const SizedBox(width: 30)
                                //     ],
                                //   ),
                                //   const SizedBox(height: 10),
                                //   Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceAround,
                                //     children: [
                                //       const Text("candy count"),
                                //       Text(
                                //         widget.pokemon["candy_count"]
                                //             .toString(),
                                //         style: const TextStyle(
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: 18),
                                //       ),
                                //       const SizedBox(width: 30)
                                //     ],
                                //   ),
                                //   const SizedBox(height: 10),
                                //   Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceAround,
                                //     children: [
                                //       const Text("egg weight"),
                                //       Text(
                                //         widget.pokemon["egg"].toString(),
                                //         style: const TextStyle(
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: 18),
                                //       ),
                                //       const SizedBox(width: 30)
                                //     ],
                                //   ),
                                // ],
                              )
                            ],
                          ),
                          Container(),
                          Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //position of pokemon Image
          Positioned(
              top: 70,
              left: 20,
              right: 0,
              // height: 150,
              child: Hero(
                tag: widget.heroTag,
                child: CachedNetworkImage(
                  imageUrl: widget.pokemon["img"],
                  height: height * .35,
                  fit: BoxFit.fitHeight,
                ),
              ))
        ],
      ),
    );
  }
}
