import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:militarysecurity/Admin/AdminHome.dart';
import 'package:militarysecurity/User/ViewProfile.dart';
import 'package:militarysecurity/Admin/auth/screens/root.dart';
import 'package:militarysecurity/User/Readings.dart';
import 'package:militarysecurity/Visuals.dart';

import '../demo.dart';
import '../floating.dart';



class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  bool _isGridVisible = false;

  @override
  void initState() {
    super.initState();
    // Adding a delay to show the grid with animation after the initial build
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isGridVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF3e4f3c),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Hello Anandu!', style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white
                  )),
                  subtitle: Text('Good Morning', style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: Colors.white54
                  )),
                  trailing: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProfile(),));

                    },
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/pop_art_effect.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: _isGridVisible ? 1.0 : 0.0,
            child: Container(
              color: const Color(0xFF3e4f3c),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(200)
                    )
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 30,
                  children: [
                    _isGridVisible ? _buildAnimatedGridItem('Vehicle Control', CupertinoIcons.game_controller, Colors.deepOrange) : SizedBox(),
                    // _isGridVisible ? _buildAnimatedGridItem('Voice Instruction', CupertinoIcons.mic_circle_fill , Colors.green) : SizedBox(),
                    _isGridVisible ? _buildAnimatedGridItem('Gps Track', CupertinoIcons.placemark_fill, Colors.purple) : SizedBox(),
                    _isGridVisible ? _buildAnimatedGridItem('View Visuals', CupertinoIcons.play_rectangle_fill, Colors.brown) : SizedBox(),
                    // _isGridVisible ? _buildAnimatedGridItem('Capture', CupertinoIcons.photo_camera_solid, Colors.indigo) : SizedBox(),
                    _isGridVisible ? _buildAnimatedGridItem('View Readings', CupertinoIcons.create_solid, Colors.teal) : SizedBox(),
                    _isGridVisible ? _buildAnimatedGridItem('Logout', CupertinoIcons.question_circle, Colors.blue) : SizedBox(),
                    _isGridVisible ? _buildAnimatedGridItem('Contact', CupertinoIcons.phone, Colors.pinkAccent) : SizedBox(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  Widget _buildAnimatedGridItem(String title, IconData iconData, Color background) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Theme.of(context).primaryColor.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 5
            )
          ]
      ),
      child: GestureDetector(
        onTap: () {
          // Navigate to different pages based on the title
          if (title == 'Contact') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Admin(folderName: '',)));
          }
          if( title=='Vehicle Control')
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Demo(),));
            }
          if (title=='Gps Track')
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Location(),));

            }  if (title=='View Readings')
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Readings(),));

            } if (title=='View Visuals')
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CarouselPage(),));

            }if (title=='Logout')
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AuthenticationScreen(),));

            }

          else {
            // Handle other grid items here
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: Colors.white)
            ),
            const SizedBox(height: 8),
            Text(title.toUpperCase(),textAlign: TextAlign.center, style: Theme.of(context).textTheme.subtitle1)
          ],
        ),
      ),
    );
  }
}
