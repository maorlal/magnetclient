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

class Recommandation extends StatelessWidget {
  final adressController = TextEditingController();
  final paidSpeedController = TextEditingController();
  final infulstructureController = TextEditingController();
  final serviceProviderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recommandation"),
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
                  'address: ',
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
                  'maximum speed(Mb/s): ',
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
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Recommanded choice:'),
                    content: const Text(
                        'infulstructure: Bezeq \nISP: 018 \nAvg speed: 100 Mb/s \n price range: 80 - 130 nis'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                // onPressed: () async {
                //   try {
                //     final socket = await Socket.connect('5.28.139.69', 5000);
                //     print('open');
                //     var str = utf8.encode(adressController.text +
                //         paidSpeedController.text +
                //         infulstructureController.text);
                //     socket.add(str);
                //     print('sent: $str');
                //     socket.listen((List<int> e) {
                //       print('listening');
                //       print(utf8.decode(e));
                //     });
                //     socket.close();
                //     socket.destroy();
                //     print('closed');
                //   } catch (e) {
                //     print(e);
                //   }
                // Navigator.pop(context);
                //},
                child: Text('submit'),
              ),
            ),
            // Container(
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     child: Text('speed test'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
