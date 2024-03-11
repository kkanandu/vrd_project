import 'package:flutter/material.dart';
import 'package:militarysecurity/Admin/auth/screens/root.dart';
import 'package:militarysecurity/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'demo.dart';

void main() {
  runApp(const MyApp());
}

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
      debugShowCheckedModeBanner: false,
    // home: MyLoginPage(title: 'VRD',),
      home: const MyHomePage(title: 'Vigilant Remote Defense'),
    );

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController ipControl = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCont();
  }

  void getCont() async {
    final sh = await SharedPreferences.getInstance();
    setState(() {
      ipControl.text = sh.getString("ip").toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: TextField(
                    controller: ipControl,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "IP Address",
                        hintText: "Enter a valid ip address"),
                  )),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    String ipv = ipControl.text;
                    final pref = await SharedPreferences.getInstance();
                    pref.setString("ip", ipv.toString());
                    pref.setString("url", "http://" + ipv.toString() + ":8000");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AuthenticationScreen()
                        ),
                    );
                  },
                  child: const Icon(Icons.key),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
