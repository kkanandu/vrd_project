import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Readings extends StatefulWidget {
  const Readings({Key? key}) : super(key: key);

  @override
  State<Readings> createState() => _ReadingsState();
}

class _ReadingsState extends State<Readings> {
  String? selectedSoldier;
  bool analyzingHeartRate = false;
  bool analyzingTempRate = false;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Readings'),

        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  height: 400.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: [
                  'assets/images/heart.jpg',
                  'assets/images/temp.jpg',
                ].map((String imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(35.0),
                        child: Stack(
                          children: [
                            Image.asset(
                              imagePath,
                              width: 400,
                              height: 400,
                              fit: BoxFit.cover,
                            ),
                            if ((analyzingHeartRate && imagePath == 'assets/images/heart.jpg') ||
                                (analyzingTempRate && imagePath == 'assets/images/temp.jpg'))
                              Positioned.fill(
                                child: Center(
                                  child: Text(
                                    'Analyzing...',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            if (!analyzingTempRate) // Show only if not analyzing temp rate
              DropdownButton<String>(
                hint: Text('Select Soldier'),
                value: selectedSoldier,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedSoldier = newValue;
                  });
                },
                items: <String>['Soldier 1', 'Soldier 2']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    analyzingHeartRate = true;
                    analyzingTempRate = false;
                  });
                  carouselController.jumpToPage(0); // Jump to heart rate slide
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent, // background color
                  elevation: 5, // elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // rounded corners
                  ),
                ),
                child: Text(
                  'Measure Heart Rate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    analyzingTempRate = true;
                    analyzingHeartRate = false;
                  });
                  carouselController.jumpToPage(1); // Jump to temp rate slide
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent, // background color
                  elevation: 5, // elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // rounded corners
                  ),
                ),
                child: Text(
                  'Measure Temp Rate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


