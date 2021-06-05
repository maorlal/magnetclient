//import 'dart:html';
import 'dart:convert';
//import 'dart:ffi';
import 'dart:io';

//import 'package:webview_windows/webview_windows.dart';
//import 'dart:convert' as convert;
//import 'package:http/http.dart' as http;
import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';
import 'package:magnetclient/ClientdData.dart';
import 'package:magnetclient/register.dart';
import 'package:magnetclient/speed_test.dart';
import 'package:magnetclient/test.dart';
//import 'package:web_socket_channel/web_socket_channel.dart';
//import 'package:web_socket_channel/status.dart' as status;
import 'package:url_launcher/url_launcher.dart';
import 'package:window_size/window_size.dart';

//import 'package:magnetclient/speed_test.dart';
//import 'package:magnetclient/test.dart';
import 'recommand.dart';
import 'register.dart';

//Socket socket;
ClientData client;
double _ping = 0, _ups = 0, _dws = 0;
int _disc = 0;
var _test_time = '01/01/1900 00:00';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setWindowMinSize(const Size(600, 600));
  setWindowMaxSize(const Size(600, 600));
  runApp(MyApp());

  // socket = await Socket.connect('5.28.139.69', 5000).then((socket) {
  //   socket.write('Hello, World!');
  //   print(socket.address);
  //   socket.add(utf8.encode('adressController.text'));
  // });
  //socket.add(utf8.encode('hello'));
  //print(socket);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAGNET',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'MAGNET'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _launched;
  ClientData _clientData = ClientData();

  //WebviewController _controller;
  //final textController = TextEditingController();
  //Future<void> _launched;
  // void _incrementCounter() {
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    _dws = _clientData.download_speed;
    _ping = _clientData.ping;
    _ups = _clientData.upload_speed;
    _disc = _clientData.disconnections;

    const String toLaunch = 'https://www.speedtest.net';
    double pingSum = 0.0;
    // var url =
    //     Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
    // const String toLaunch = 'https://www.cylog.org/headers/';
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'download speed: ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '$_dws Mb/s  ',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'upload speed: ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '$_ups  Mb/s   ',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'ping: ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '$_ping ms    ',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'connection lost since login: ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '$_disc',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'last speed test: ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '$_test_time',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () => setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SpeedTest();
                  }),
                );
                _launched = _launchInWebViewOrVC(toLaunch);
              }),
              child: const Text('speed test'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Recommandation();
                  }),
                );
              },
              child: const Text('get recommendation'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Register();
                  }),
                );
              },
              child: const Text('personal info'),
            ),
            // TextButton(
            //   style: TextButton.styleFrom(
            //     textStyle: const TextStyle(fontSize: 20),
            //   ),
            //   onPressed: () {
            //     final pingObj = Ping('8.8.8.8', count: 5);
            //     const start = "time:";
            //     const end = " ms";

            //     pingObj.stream.listen((event) {
            //       setState(() {
            //         var disc = 0;
            //         var str = event.toString();
            //         if (str.indexOf('failed') > 0) {
            //           disc++;
            //           print(disc);
            //           if (disc > 0) {
            //             _disc++;
            //           }
            //         } else {
            //           print(disc);
            //           final startIndex = str.indexOf(start);
            //           final endIndex =
            //               str.indexOf(end, startIndex + start.length);
            //           var pingNum = double.parse(
            //               str.substring(startIndex + start.length, endIndex));
            //           pingSum = pingSum + pingNum;
            //           print(pingSum);
            //           _ping = pingSum / 5;
            //         }
            //       });
            //     });
            //   },
            //   child: const Text('ping'),
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

//void _sendMsg() {}
  // Future<void> initPlatformState() async {
  //   _controller = WebviewController();

  //   await _controller.initialize();
  //   _controller.url.listen((url) {
  //     textController.text = url;
  //   });
  //   await _controller.loadUrl('https://flutter.dev');

  //   if (!mounted) return;

  //   setState(() {});
  // }

  // void makeRequest() async {
  //   var response = await http.get(
  //       Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'}));
  //   //If the http request is successful the statusCode will be 200
  //   if (response.statusCode == 200) {
  //     String htmlToParse = response.body;
  //     print(htmlToParse);
  //   }
  // }
}
