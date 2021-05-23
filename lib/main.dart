import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _ping = 0, _ups = 0, _dws = 0, _disc = 0;
  var _test_time = '01/01/1900 00:00';

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                  '$_dws Mb/s    ',
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
              onPressed: () {},
              child: const Text('speed test'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: const Text('get recommendation'),
            ),
          ],
        ),
      ),
    );
  }
}
