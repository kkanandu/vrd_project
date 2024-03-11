import 'package:flutter/material.dart';
import 'package:militarysecurity/Admin/auth/screens/login_screen.dart';
import 'package:militarysecurity/Admin/auth/screens/root.dart';
import 'package:militarysecurity/Admin/auth/screens/verify_screen.dart';
import 'package:militarysecurity/User/Readings.dart';
import 'package:militarysecurity/Visuals.dart';
import 'auth/screens/register_screen.dart';
import 'package:militarysecurity/Admin/ManageSoldiers.dart';
import 'package:militarysecurity/Admin/auth/screens/AdminRegistration.dart';
import 'package:militarysecurity/Admin/utils/app_colors.dart';
import 'package:militarysecurity/Admin/auth/screens/login_screen.dart';
// import 'package:militarysecurity/Admin/auth/screens/register_screen.dart';


class Admin extends StatefulWidget {
  final String folderName;
  const Admin({required this.folderName, Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Container buildFileRow(String folderName, bool showAlert) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Icon(
                    Icons.folder,
                    color: Colors.blue[200],
                  ),
                  if (showAlert)
                    Positioned(
                      right: -1,
                      top: 2,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const CircleAvatar(
                          radius: 3.5,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                folderName,
                style: const TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAvatar(String name, String filename) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: Image.asset('assets/images/$filename.jpeg').image,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              alignment: Alignment.bottomCenter,
              height: 170,
              decoration: BoxDecoration(color: Colors.grey),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.folderName,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "VRD",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black.withOpacity(.05),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.search,
                            size: 25,
                            color: Colors.blue,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.only(left: 25, top: 25),
            //   height: 130,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       buildAvatar('Mia', 'mia'),
            //       buildAvatar('Adam', 'adam'),
            //       buildAvatar('Jess', 'jess'),
            //       buildAvatar('Mike', 'mike'),
            //       buildAvatar('Brandon', 'brandon'),
            //       buildAvatar('Alie', 'alie'),
            //     ],
            //   ),
            // ),
            const Divider(),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(25),
              physics: NeverScrollableScrollPhysics(),
              children: [
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
                  },
                  child: buildFileRow('Registration', true),
                ),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SoldierManagement(),));
                    },
                    child: buildFileRow('Manage Soldiers', false)),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Readings(),));
                    },
                    child: buildFileRow('View Readings', false)),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CarouselPage(),));
                  },
                    child: buildFileRow('View Visuals', false)),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AuthenticationScreen(),));
                    },
                    child: buildFileRow('Logout', false)),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.grey.shade300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.folder,
                color: Colors.blue,
              ),
              onPressed: () {
                // Handle icon button pressed
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.white, blurRadius: 1)],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }}


