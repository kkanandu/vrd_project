import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:militarysecurity/Admin/AdminHome.dart';
import 'package:string_validator/string_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:militarysecurity/Admin/utils/app_colors.dart';
import '../../utils/styles/text_field_style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key, required this.controller});
  final PageController controller;
  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  late File? _image;
  final picker = ImagePicker();

  final fKey = GlobalKey<FormState>();
  String imagepath='No File Choosen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.fromSize(
        size: MediaQuery.sizeOf(context),
        child: Stack(
          children: [
            Positioned(
              right: (MediaQuery.sizeOf(context).width / 2) - 150,
              top: 60,
              child: Transform.rotate(
                angle: -pi * 0,
                child: SvgPicture.asset(
                  'assets/images/demo.svg',
                  width: 300,
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 300,
              child: Transform.rotate(
                angle: -pi * 0.1,
                child: Image.asset(
                  'assets/images/tank.png',
                  width: 80,
                ),
              ),
            ),
            Positioned(
              right: 100,
              bottom: 30,
              child: Transform.rotate(
                angle: -pi * 0.04,
                child: Image.asset(
                  'assets/images/cardiogram.png',
                  width: 200,
                ),
              ),
            ),
            Positioned(
              left: 30,
              right: 30,
              bottom: 30,
              // padding: const EdgeInsets.all(30),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.whiteColor.withOpacity(.8),
                ),
                child: Form(
                  key: fKey,
                  child: Column(
                    textDirection: TextDirection.ltr,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Registration',
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
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your name";
                          } else if (value.length < 4) {
                            return "Name must have at least 4 chars";
                          }
                          return null;
                        },
                        style: textFieldTextStyle(),
                        decoration: textFieldDecoration('Name'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your mail";
                          } else if (!isEmail(value)) {
                            return "Please enter a valid mail";
                          }
                          return null;
                        },
                        style: textFieldTextStyle(),
                        decoration: textFieldDecoration('Email'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextFormField(
                                obscureText: true,
                                controller: _passController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter your password";
                                  } else if (value.length < 6) {
                                    return "Password must have at least 6 chars";
                                  }
                                  return null;
                                },
                                style: textFieldTextStyle(),
                                decoration: textFieldDecoration('Password')),
                          ),
                          // const SizedBox(width: 10),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _idController,
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return "Enter your mail";
                        //   } else if (!isEmail(value)) {
                        //     return "Please enter a valid mail";
                        //   }
                        //   return null;
                        // },
                        style: textFieldTextStyle(),
                        decoration: textFieldDecoration('ID Proof'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              alignment:Alignment.centerLeft,
                              backgroundColor: AppColors.darkGrey,
                              foregroundColor: AppColors.whiteColor,
                            ),
                            onPressed: () async {
                              await getImage();
                            },
                            child: const Text("Choose File"),
                          ),
                          Text(' '+imagepath.toString().substring(imagepath.length - 15, imagepath.length))

                        ],
                      ),
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: AppColors.whiteColor,
                          ),
                          onPressed: () async {
                            if (fKey.currentState!.validate()) {
                              // Form is valid, proceed with registration
                              register({
                                "username": _nameController.text,
                                "email": _emailController.text,
                                "password": _passController.text,
                                "id_proof": _idController.text,
                                // 'image': _image
                              });
                            } else {
                              // Form is not valid, display error messages
                              print('Form validation failed');
                            }
                          },
                          child: const Text("Create account"),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       ' have an account?',
                      //       textAlign: TextAlign.center,
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
                      //         widget.controller.animateToPage(0,
                      //             duration: const Duration(milliseconds: 500),
                      //             curve: Curves.ease);
                      //       },
                      //       child: Text(
                      //         'Log In ',
                      //         style: TextStyle(
                      //           color: AppColors.primaryHighContrast,
                      //           fontSize: 13,
                      //           fontWeight: FontWeight.w500,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
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



  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        imagepath = pickedFile.path;
      } else {
        print('No image selected.');
      }
    });
  }
  // Future<void> register(Map<String, dynamic> data) async {
  //   String url = 'http://192.168.1.15:5000/registration?vrd=$data';
  //   try {
  //     var request = http.MultipartRequest('POST', Uri.parse(url));
  //     // Add form fields
  //
  //     data.forEach((key, value) {
  //       request.fields[key] = value.toString();
  //     });
  //     // Add image file if available
  //     if (_image != null) {
  //       print('Image path: ${_image!.path}');
  //       request.files.add(await http.MultipartFile.fromPath(
  //         'image',
  //         _image!.path,
  //       ));
  //     } else {
  //       print('No image selected.');
  //     }
  //     var response = await request.send();
  //     if (response.statusCode == 200) {
  //       // Registration successful
  //       print('Registration successful');
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => Admin(folderName: ''),));
  //     } else {
  //       // Registration failed
  //       print('Registration failed');
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: e.toString());
  //     // Handle errors
  //     print('Error: $e');
  //   }
  // }
  Future<void> register(Map<String, dynamic> data) async {
    String url = 'http://192.168.1.15:5000/registration?vrd=$data';
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
    //  request.headers['Content-Type'] = 'multipart/form-data';

      // request.fields['username'] = "abc";
      // request.fields['email'] = "cdf";
      // request.fields['password'] = "123";
      // if (_image != null) {
      //   request.files.add(await http.MultipartFile.fromPath(
      //     'image',
      //     _image!.path,
      //   ));
      // } else {
      //   print('No image selected.');
      // }

      // Add other form fields
      //request.fields.addAll(data.map((key, value) => MapEntry(key, value.toString())));

      var response = await request.send();
      if (response.statusCode == 201) {
        print('Registration successful');
        Navigator.push(context, MaterialPageRoute(builder: (context) => Admin(folderName: ''),));
      } else {
        print('Registration failed');
        Fluttertoast.showToast(msg:'Registration failed' );
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      print('Error: $e');
    }
  }
}

