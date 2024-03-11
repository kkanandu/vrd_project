import 'package:flutter/material.dart';

import 'User/UserHome.dart';
import 'const.dart';


// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyLoginPage(title: 'Login'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key, required this.title});

  final String title;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController UsernameControl = new TextEditingController();
  TextEditingController PasswordControl = new TextEditingController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getCont();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [c1,c2]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(image:AssetImage('assets/images/contimg.jpeg')
              ),
              const Text(
                "Welcome Back",style: TextStyle(
                color:Colors.white,fontSize: 30
              ),
              ),
              SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: TextField(
                    controller: UsernameControl,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Username'
                    ),
                  )
              ),
              SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: TextField(
                    controller: PasswordControl,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: 'Password'
                    ),
                  )
              ),
              SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: ElevatedButton(onPressed: () {  },
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UserHome(),));
                        
                      },
                        child: Text("Login")),
                    style: ButtonStyle(
                      backgroundColor:  MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  )
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      )
    );
  }
}
