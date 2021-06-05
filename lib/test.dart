//import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'main.dart';
import 'dart:async';
import 'tcp.dart';
import 'ClientdData.dart';
import 'speed_test.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SpeedTest extends StatelessWidget {
  final downloadSpeedController = TextEditingController();
  final uploadSpeedController = TextEditingController();
  final pingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Speed Test"),
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
                  'Download Speed: ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  width: 200.0,
                  child: TextField(
                    controller: downloadSpeedController,
                    autofocus: true,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Upload Speed: ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  width: 200.0,
                  child: TextField(
                    controller: uploadSpeedController,
                    autofocus: true,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'ping: ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  width: 200.0,
                  child: TextField(
                    controller: pingController,
                    autofocus: true,
                  ),
                ),
              ],
            ),
            Container(
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final socket = await Socket.connect('5.28.139.69', 5000);
                    print('open');
                    var str = utf8.encode(downloadSpeedController.text +
                        uploadSpeedController.text +
                        pingController.text);
                    socket.add(str);
                    print('sent: $str');
                    socket.listen((List<int> e) {
                      print('listening');
                      print(utf8.decode(e));
                    });
                    socket.close();
                    socket.destroy();
                    print('closed');
                  } catch (e) {
                    print(e);
                  }
                  Navigator.pop(context);
                },
                child: Text('submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
