import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  List<String> imagePaths = [
    'assets/images/visual1.jpg',
    'assets/images/visual2.jpg',
    'assets/images/visual3.jpg',
    'assets/images/visual4.jpg',
    'assets/images/visual5.jpg',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visuals'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: PhotoView(
                initialScale: .7,
                minScale: 0.7,
                maxScale: 4.0,
                imageProvider: AssetImage(
                  imagePaths[_currentIndex],
                ),
                backgroundDecoration: BoxDecoration(color: Colors.transparent),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imagePaths.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _currentIndex == index
                              ? Colors.blue
                              : Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: Image.asset(
                        imagePaths[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
