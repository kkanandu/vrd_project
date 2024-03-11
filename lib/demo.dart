// import 'dart:math';
// import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter/material.dart';
//
// class Demo extends StatefulWidget {
//   const Demo({super.key});
//
//
//   @override
//   State<Demo> createState() => _DemoState();
// }
//
// class _DemoState extends State<Demo>{
//   @override
//   final _controller =WebViewController()
//
//     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     ..setBackgroundColor(const Color(0x00000000))
//     ..setNavigationDelegate(
//       NavigationDelegate(
//         onProgress: (int progress) {
//           // Update loading bar.
//         },
//         onPageStarted: (String url) {},
//         onPageFinished: (String url) {},
//         onWebResourceError: (WebResourceError error) {},
//         onNavigationRequest: (NavigationRequest request) {
//
//           return NavigationDecision.navigate;
//         },
//       ),
//     )
//     ..loadRequest(Uri.parse('https://www.youtube.com'));
//   @override
//   Widget build(BuildContext context) {
//
//    return Scaffold(
//      floatingActionButtonLocation: ExpandableFab.location,
//      floatingActionButton: ExpandableFab(
//        openButtonBuilder: RotateFloatingActionButtonBuilder(
//          child: const Icon(Icons.add_circle_outline),
//     fabSize: ExpandableFabSize.regular,
//     foregroundColor: Colors.white,
//     backgroundColor: Colors.black,
//     shape: const CircleBorder(),
//     ),
//        closeButtonBuilder: FloatingActionButtonBuilder(
//          size: 56,
//          builder: (BuildContext context, void Function()? onPressed,
//              Animation<double> progress) {
//            return IconButton(
//              onPressed: onPressed,
//              icon: const Icon(
//                Icons.build_circle_outlined,
//                size: 40,
//              ),
//            );
//          },
//        ),
//
//        children: [
//          FloatingActionButton.small(
//            heroTag: null,
//            child: const Icon(Icons.camera),
//            onPressed: () {},
//          ),
//          FloatingActionButton.small(
//            heroTag: null,
//            child: const Icon(Icons.edit),
//            onPressed: () {},
//          ),
//          FloatingActionButton.small(
//            heroTag: null,
//            child: const Icon(Icons.record_voice_over),
//            onPressed: () {},
//          ),
//        ],
//      ),
//      appBar: AppBar(title: const Text('Military')),
//      body: Column(
//        children: [
//          Container(
//            height: 400,
//              width: 500,
//              child: WebViewWidget(controller: _controller)
//          ),
//          SizedBox(height: 60,),
//
//          Center(
//            child: MyAnimatedButtons(),
//          ),
//        ],
//      ),
//    );
//
//   }
//
// }
//
// class MyAnimatedButtons extends StatefulWidget {
//   @override
//   _MyAnimatedButtonsState createState() => _MyAnimatedButtonsState();
// }
//
// class _MyAnimatedButtonsState extends State<MyAnimatedButtons> {
//   double _buttonSize = 50.0;
//
//   void _animateButton() {
//     setState(() {
//       _buttonSize = _buttonSize > 20.0 ? _buttonSize - 10.0 : 20.0;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 10.0),
//               width: _buttonSize,
//               height: _buttonSize,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.blue,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.5),
//                     spreadRadius: 5.0,
//                     blurRadius: 7.0,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Icon(
//                 Icons.arrow_circle_up,
//                 size: _buttonSize * 0.7,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(width: 10),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 10.0),
//               width: _buttonSize,
//               height: _buttonSize,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.blue,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.5),
//                     spreadRadius: 5.0,
//                     blurRadius: 7.0,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Icon(
//                 Icons.arrow_circle_down,
//                 size: _buttonSize * 0.7,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 10),
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 10.0),
//           width: _buttonSize,
//           height: _buttonSize,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.blue,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.5),
//                 spreadRadius: 5.0,
//                 blurRadius: 7.0,
//                 offset: Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Icon(
//             Icons.stop_circle,
//             size: _buttonSize * 0.7,
//             color: Colors.white,
//           ),
//         ),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 10.0),
//               width: _buttonSize,
//               height: _buttonSize,
//               decoration: BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(_buttonSize / 2),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.5),
//                     spreadRadius: 5.0,
//                     blurRadius: 7.0,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Icon(
//                 Icons.arrow_circle_left,
//                 size: _buttonSize * 0.7,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(width: 10),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 10.0),
//               width: _buttonSize,
//               height: _buttonSize,
//               decoration: BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(_buttonSize / 2),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.5),
//                     spreadRadius: 5.0,
//                     blurRadius: 7.0,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Icon(
//                 Icons.arrow_circle_right,
//                 size: _buttonSize * 0.7,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 20.0),
//       ],
//     );
//   }
// }
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final _controller = WebViewController()
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
    ..loadRequest(Uri.parse('https://github.com/kkanandu'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Military'),
        backgroundColor: Colors.cyan,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 400,
                  width: 500,

                  color: Colors.blueGrey, // Background color for the WebView
                  child: WebViewWidget(controller: _controller),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                flex: 0,
                child: MyAnimatedButtons(),
              ),
            ],
          ),
          Positioned(
            bottom: 150,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                // Microphone button functionality here.
              },
              child: Icon(Icons.mic),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.add_circle_outline),
          fabSize: ExpandableFabSize.regular,
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          shape: const CircleBorder(),
        ),
        closeButtonBuilder: FloatingActionButtonBuilder(
          size: 56,
          builder: (BuildContext context, void Function()? onPressed,
              Animation<double> progress) {
            return IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.build_circle_outlined,
                size: 40,
              ),
            );
          },
        ),
        children: [
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.camera),
            onPressed: () {},
          ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.edit),
            onPressed: () {},
          ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.record_voice_over),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class MyAnimatedButtons extends StatefulWidget {
  @override
  _MyAnimatedButtonsState createState() => _MyAnimatedButtonsState();
}

class _MyAnimatedButtonsState extends State<MyAnimatedButtons> {
  double _buttonSize = 50.0;

  void _animateButton() {
    setState(() {
      _buttonSize = _buttonSize > 20.0 ? _buttonSize - 10.0 : 20.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              width: _buttonSize,
              height: _buttonSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5.0,
                    blurRadius: 7.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_circle_up,
                size: _buttonSize * 0.7,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              width: _buttonSize,
              height: _buttonSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5.0,
                    blurRadius: 7.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_circle_down,
                size: _buttonSize * 0.7,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          width: _buttonSize,
          height: _buttonSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5.0,
                blurRadius: 7.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Icon(
            Icons.stop_circle,
            size: _buttonSize * 0.7,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              width: _buttonSize,
              height: _buttonSize,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.blue,
                borderRadius: BorderRadius.circular(_buttonSize / 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5.0,
                    blurRadius: 7.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_circle_left,
                size: _buttonSize * 0.7,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              width: _buttonSize,
              height: _buttonSize,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.blue,
                borderRadius: BorderRadius.circular(_buttonSize / 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5.0,
                    blurRadius: 7.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_circle_right,
                size: _buttonSize * 0.7,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
