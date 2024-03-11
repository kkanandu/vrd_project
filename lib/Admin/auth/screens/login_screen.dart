import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:militarysecurity/Admin/AdminHome.dart';
import 'package:militarysecurity/User/UserHome.dart';
import 'package:string_validator/string_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../utils/app_colors.dart';
import '../../utils/styles/text_field_style.dart';
import 'package:http/http.dart' as http;
import '../../utils/utils.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.controller});
  final PageController controller;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.fromSize(
        size: MediaQuery.sizeOf(context),
        child: Stack(
          children: [
            Positioned(
              right: 40,
              top: 140,
              child: Transform.rotate(
                angle: pi * .1,
                child: Image.asset(
                  'assets/images/soldier1.png',
                  width: 60,
                ),
              ),
            ),
            Positioned(
              left: 80,
              top: 300,
              child: Transform.rotate(
                angle: -pi * 0.05,
                child: Image.asset(
                  'assets/images/health-care.png',
                  width: 50,
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 20,
              child: Transform.rotate(
                angle: -pi * 0.14,
                child: Image.asset(
                  'assets/images/technology.png',
                  width: 120,
                ),
              ),
            ),
            Positioned(
              left: -30,
              top: 30,
              child: SvgPicture.asset(
                'assets/images/log.svg',
                width: 240,
              ),
            ),
            Positioned(
              // padding: const EdgeInsets.all(30),
              bottom: 30,
              left: 30,
              right: 30,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.whiteColor.withOpacity(.8),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    // padding: const EdgeInsets.symmetric(horizontal: 50),
                    children: [
                      Text(
                        'Log In',
                        style: TextStyle(
                          color: AppColors.primaryHighContrast,
                          fontSize: 27,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter you e-mail.";
                          } else if (!isEmail(value)) {
                            return "Invalid mail";
                          }
                          return null;
                        },
                        controller: _emailController,
                        style: textFieldTextStyle(),
                        decoration: textFieldDecoration('Email'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter you password";
                          } else if (value.length < 6) {
                            return "Must have at least 6 chars";
                          }
                          return null;
                        },
                        focusNode: FocusNode(
                          canRequestFocus: true,
                        ),
                        controller: _passController,
                        style: textFieldTextStyle(),
                        decoration: textFieldDecoration('Password'),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: AppColors.whiteColor,
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                print('ok');
                                loadingDialog(context);
                                await Login(
                                    _emailController.text, _passController.text);

                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Please fill in all fields',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                              // Navigator.push(context, MaterialPageRoute(builder:(context) => Admin(folderName: '',), ));
                              //
                              FocusManager.instance.primaryFocus?.unfocus();
                              Future.delayed(const Duration(seconds: 2));

                            },
                            child: const Text("Sign In")),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       'Don’t have an account?',
                      //       style: TextStyle(
                      //         color: AppColors.primaryDark,
                      //         fontSize: 13,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //       width: 2.5,
                      //     ),
                      //     InkWell(
                      //       onTap: () {
                      //         FocusManager.instance.primaryFocus?.unfocus();
                      //         widget.controller.animateToPage(1,
                      //             duration: const Duration(milliseconds: 500),
                      //             curve: Curves.ease);
                      //       },
                      //       child: Text(
                      //         'Sign Up',
                      //         style: TextStyle(
                      //           color: AppColors.primaryHighContrast,
                      //           fontSize: 13,
                      //           fontWeight: FontWeight.w500,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: AppColors.primaryHighContrast,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> Login(String username, String password) async {
    print(password);
    print(username);
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.15:5000/login?username=$username&password=$password'),
        headers: <String,String>
        {
          'Content-Type':'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data['task'] == 'success') {
          print('Login successful');
          // Login successful
          Navigator.push(context, MaterialPageRoute(builder:(context) => UserHome(), ));
          // Navigate to the next screen or perform other actions
          print('Type: ${data['type']}');
          print('User ID: ${data['lid']}');
        } else {
          // Login failed
          print('Invalid credentials');
        }
      } else {
        // Handle HTTP errors
        print('Failed to login: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Handle other errors
      print('Error: $e');
    }
  }

}
