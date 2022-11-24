// import 'package:flutter/material.dart';
//
//
// /// This Widget is the main application widget.
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Home(),
//     );
//   }
// }
//
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         title: const Text('Confirmation Dialog'),
//     backgroundColor: Colors.teal),
//     body: Future<void> _showMyDialog() async {
//       return showDialog<void>(
//         context: context,
//         barrierDismissible: false, // user must tap button!
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('AlertDialog Title'),
//             content: SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   Text('This is a demo alert dialog.'),
//                   Text('Would you like to confirm this message?'),
//                 ],
//               ),
//             ),
//             actions: <Widget>[
//               TextButton(
//                 child: Text('Confirm'),
//                 onPressed: () {
//                   print('Confirmed');
//                   Navigator.of(context).pop();
//                 },
//               ),
//               TextButton(
//                 child: Text('Cancel'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
// }