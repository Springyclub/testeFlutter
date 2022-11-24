import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(color:Colors.blue, width: 50, height: 50,),
            Container(color:Colors.green, width: 50, height: 50,),
          ],

        )
    );
  }
}
