import 'package:audify/splash%20screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  List<Widget> photo = [
    Image.asset('assets/bear.png'),
    Image.asset('assets/denim.png'),
    Image.asset('assets/mountains.png'),
    Image.asset('assets/warriors.png'),
  ];
  List<String> name = [
    "apple",
    "orange",
    "banana",
  ];
  List<Widget> image = [
    Image.asset('assets/tomato.png'),
    Image.asset('assets/mango.png'),
    Image.asset('assets/watermelon.png'),
    Image.asset('assets/tomato.png'),
    Image.asset('assets/mango.png'),
    Image.asset('assets/watermelon.png'),
  ];
  List<Widget> icon = [
    Icon(Icons.apple, size: 30),
    Icon(Icons.star, size: 30),
    Icon(Icons.square, size: 30),
  ];
  List<Widget> carouselItems = [
    Container(
      width: 400,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.black, // Border color
          width: 3.0, // Border width
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset('assets/spotify.png', fit: BoxFit.cover),
      ),
    ),
    Container(
      width: 400,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.black,
          width: 3.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset('assets/logo.png', fit: BoxFit.cover),
      ),
    ),
    Container(
      width: 400,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.black,
          width: 3.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset('assets/music.png', fit: BoxFit.cover),
      ),
    ),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(23.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back)),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 247, 247, 247),
                      borderRadius: BorderRadius.circular(17)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(fontSize: 24, color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 35,
                        )),
                  ),
                  height: 70,
                  width: 400,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 67,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: name.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  icon[index],
                                  Text(
                                    name[index],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              width: 180,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color.fromARGB(255, 247, 247, 247),
                                  border: Border.all(color: Colors.grey)),
                            ));
                      }),
                ),
                Stack(
                  children: [
                    CarouselSlider(
                      carouselController: _carouselController,
                      items: carouselItems,
                      options: CarouselOptions(
                        height: 160, // Customize the height of the carousel
                        autoPlay: true, // Enable auto-play
                        enlargeCenterPage:
                            true, // Increase the size of the center item
                        enableInfiniteScroll: true, // Enable infinite scroll
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                          // Optional callback when the page changes
                          // You can use it to update any additional UI components
                        },
                      ),
                    ),
                    Positioned(
                      top: 145,
                      left: 150,
                      child: AnimatedSmoothIndicator(
                        activeIndex: _currentIndex,
                        count: carouselItems.length,
                        effect: WormEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          activeDotColor: Colors.white,
                          dotColor: Colors.red.withOpacity(0.3),
                        ),
                        onDotClicked: (index) {
                          _carouselController.animateToPage(index);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Tittle",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
                SizedBox(
                  height: 200,
                  width: 400,
                  child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: image.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  image[index],
                                  Text(
                                    "Tittle",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                            ));
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Tittle",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
                SizedBox(
                  height: 400,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of items in each row
                      mainAxisSpacing: 10.0, // spacing between rows
                      crossAxisSpacing: 10.0, // spacing between columns
                    ),
                    padding: EdgeInsets.all(10.0), // padding around the grid
                    itemCount: image.length, // total number of items
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 100,
                                child: Image.asset('assets/food.png',
                                    fit: BoxFit.cover)),
                            Text(
                              "Tittle",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
