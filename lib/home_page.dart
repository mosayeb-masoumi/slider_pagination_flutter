
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int carouselCurrentPosition = 0;
  late CarouselController carouselController;

  List<PostModel> carouselList = [];

  @override
  void initState() {
    super.initState();
    carouselController = CarouselController();

    carouselList = getList();

    carouselCurrentPosition = 2;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var listSize = carouselList.length;
    var current = carouselCurrentPosition;

    if((listSize - current) == 5 ){
      carouselList.addAll(getList());
    }

    return Scaffold(
        appBar: AppBar(

          title: Text("pagination in slider"),
        ),
        body: CarouselSlider(
          carouselController: carouselController,

          options: CarouselOptions(
            height: size.height,
            aspectRatio: 1,
            // viewportFraction: 0.7,
            viewportFraction: 1,
            initialPage: carouselCurrentPosition,
            // enlargeStrategy: CenterPageEnlargeStrategy.height,

            enableInfiniteScroll: false,
            reverse: false,
            // enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                carouselCurrentPosition = index;
              });
            },
            scrollDirection: Axis.vertical,
          ),
          items: carouselList.map((item) {
            return Builder(builder: (context) {
              bool isOdd = (carouselCurrentPosition & 0x01) != 0;

              return Container(
                width: size.width,
                height: size.height,
                color: isOdd ? Colors.blueGrey : Colors.blueAccent,
                child: Center(
                  child: Text("$carouselCurrentPosition"),
                ),
              );
            });
          }).toList(),
        ));
  }

  List<PostModel> getList() {
    List<PostModel> list = [];
    list.add(PostModel(0));
    list.add(PostModel(1));
    list.add(PostModel(2));
    list.add(PostModel(3));
    list.add(PostModel(4));
    list.add(PostModel(5));
    list.add(PostModel(6));
    list.add(PostModel(7));
    list.add(PostModel(8));
    list.add(PostModel(9));
    return list;
  }
}

class PostModel {
  int index;

  PostModel(this.index);
}
