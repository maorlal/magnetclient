import 'package:flutter/material.dart';
import 'package:magnetclient/main.dart';
import 'dart:io';
//import 'package:internet_speed_test/internet_speed_test.dart';
//import 'package:internet_speed_test/callbacks_enum.dart';

// class SpeedTest extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Speed Test"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }

class _SpeedTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Field Focus',
      home: TestRresults(),
    );
  }
}

// Define a custom Form widget.
class TestRresults extends StatefulWidget {
  @override
  _TestRresultsState createState() => _TestRresultsState();
}

class _TestRresultsState extends State<TestRresults> {
  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speed Test Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Download speed: ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  width: 100.0,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 0.2),
                    ),
                    autofocus: true,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Upload speed: ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  width: 100.0,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 0.2),
                    ),
                    focusNode: myFocusNode,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() {
                    myFocusNode.requestFocus();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return MyHomePage();
                      }),
                    );
                  }),
                  child: Text('Go back!'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
