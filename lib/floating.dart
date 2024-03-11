import 'dart:math';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});


  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location>{
  @override
  final _controller =WebViewController()

    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {

          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://www.google.co.in/maps?q=11.2600612,75.7952727'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(

          child: WebViewWidget(controller: _controller)
      ),
    );

}
}