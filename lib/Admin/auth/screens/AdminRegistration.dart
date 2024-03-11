import 'package:flutter/material.dart';
import 'package:militarysecurity/Admin/auth/screens/AdminLogin.dart';
import 'package:militarysecurity/Admin/auth/screens/register_screen.dart';
import 'package:militarysecurity/Admin/utils/app_colors.dart';
import 'package:militarysecurity/Admin/utils/custom_bg.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late PageController controller;
  late int selectedIndex;
  late double pageValue;

  @override
  void initState() {
    selectedIndex = 0;
    pageValue = 0.0;
    controller =
    PageController(initialPage: selectedIndex, viewportFraction: 1.0)
      ..addListener(() {
        setState(() {
          pageValue = controller.page!;
        });
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
            left: pageValue * -w,
            top: 2,
            child: Container(
              height: h,
              width: w * 3,
              decoration: const BoxDecoration(),
              child: CustomPaint(
                painter: CustomBackground(
                  firstColor: AppColors.primaryColor,
                  secondColor: AppColors.primaryDark,
                ),
              ),
            ),
          ),
          PageView.builder(
            physics: const NeverScrollableScrollPhysics(
              parent: ClampingScrollPhysics(),
            ),
            itemCount: 2,
            controller: controller,
            itemBuilder: (context, index) {
              if (index == 0) {
                return SingUpScreen(controller: controller);
              }
              // } else if (index == 1) {
              //   return AdminLoginScreen(controller: controller);
              //
              // }
            },
          ),
        ],
      ),
    );
  }
}
