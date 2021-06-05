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

class Register extends StatelessWidget {
  final adressController = TextEditingController();
  final paidSpeedController = TextEditingController();
  final infulstructureController = TextEditingController();
  final serviceProviderController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
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
                  'Address: ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  width: 200.0,
                  child: TextField(
                    controller: adressController,
                    autofocus: true,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'speed paid for: ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  width: 200.0,
                  child: TextField(
                    controller: paidSpeedController,
                    autofocus: true,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'infulstructure: ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  width: 200.0,
                  child: TextField(
                    controller: infulstructureController,
                    autofocus: true,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'service provider: ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  width: 200.0,
                  child: TextField(
                    controller: serviceProviderController,
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
                    var str = utf8.encode(adressController.text +
                        paidSpeedController.text +
                        infulstructureController.text);
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
