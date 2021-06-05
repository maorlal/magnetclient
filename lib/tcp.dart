// import 'dart:io';
// import 'dart:convert';
// // import 'main.dart';
// // import 'dart:async';

// Socket _socket;
// const String SERVER_IP = "5.28.139.69";
// const int SERVER_PORT = 5000;

// Future<bool> sendMessage(String message, Function connectionListener,
//     Function messageListener) async {
//   try {
//     _socket = await Socket.connect(SERVER_IP, SERVER_PORT);
//     connectionListener(true);
//     _socket.listen((List<int> event) {
//       String message = utf8.decode(event);
//       print('Message: $message');
//       messageListener(message);
//     });
//     _socket.add(utf8.encode(message));
//     _socket.close();
//   } catch (e) {
//     connectionListener(false);
//     return false;
//   }
//   return true;
// }

// void cleanUp() {
//   if (null != _socket) {
//     _socket.destroy();
//   }
// }

// // Call like this
// sendMessage(_textEditingController.text,
//                     connectionListener, messageListener);

// // When the socket receives message, this function gets called...check the above code where we're sending this
// // function as the parameter of the sendMessage function.
// void messageListener(String message) {
//     setState(() {
//       _messages.add(message);
//     });
//     print(_messages);
//   }

// // When the socket gets connected, this function gets called...check the above code where we're sending this
// // function as the parameter of the sendMessage function.
//   void connectionListener(bool connected) {
//     setState(() {
//       _status = 'Status : ' + (connected ? 'Connected' : 'Failed to connect');
//     });
//   }

// // handShake() {
// //   Socket.connect(" ", 5000).then((Socket sock) {
// //     socket = sock;
// //     socket.listen(dataHandler,
// //         onError: errorHandler, onDone: doneHandler, cancelOnError: false);
// //   }).catchError((e) {
// //     print("Unable to connect: $e");
// //   });
// //   return stdin.listen(
// //       (data) => socket.write(new String.fromCharCodes(data).trim() + '\n'));
// // }

// // void dataHandler(data) {
// //   print(new String.fromCharCodes(data).trim());
// // }

// // void errorHandler(error, StackTrace trace) {
// //   print(error);
// // }

// // void doneHandler() {
// //   socket.destroy();
// // }

// // Future<void> sendMessage(Socket socket, String message) async {
// //   print('Client: $message');
// //   socket.write(message);
// //   print(socket.port);
// //   print(message);
// //   await Future.delayed(Duration(seconds: 2));
// // }
