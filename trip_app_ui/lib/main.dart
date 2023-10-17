import 'package:flutter/material.dart';
import 'package:trip_app_ui/FadeAnimation.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: "Nunito"),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;

  void _onScroll() {}

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 2)..addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          makePage("assets/images/one.jpg", 1, "Yosemite National Park",
              "Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome."),
          makePage("assets/images/two.jpg", 2, "Golden Gate Bridge",
              "The Golden Gate Bridge is a suspension bridge spanning the Golden Gate, the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean."),
          makePage("assets/images/three.jpg", 3, "Sedona",
              "Sedona is regularly described as one of America's most beautiful places. Nowhere else will you find a landscape as dramatically colorful."),
          makePage("assets/images/four.jpg", 4, "Savannah",
              "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak."),
        ],
      ),
    );
  }

  Widget makePage(String image, int page, String title, String description) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: const [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.2)
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  FadeAnimation(
                    delay: 1,
                    child: Text(
                      page.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    "/4",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      delay: 1,
                      child: Text(
                        title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    FadeAnimation(
                      delay: 1.5,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 3.0),
                            child: const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15.0,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 3.0),
                            child: const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15.0,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 3.0),
                            child: const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15.0,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 3.0),
                            child: const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15.0,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 5.0),
                            child: const Icon(
                              Icons.star,
                              color: Colors.grey,
                              size: 15.0,
                            ),
                          ),
                          const Text(
                            "4.0",
                            style: TextStyle(color: Colors.white70),
                          ),
                          const Text(
                            "(2300)",
                            style: TextStyle(
                                color: Colors.white38, fontSize: 12.0),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      delay: 2.0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50.0),
                        child: Text(
                          description,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              height: 1.9,
                              fontSize: 15.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const FadeAnimation(
                      delay: 2.5,
                      child: Text(
                        "READ MORE",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
