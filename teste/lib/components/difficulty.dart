import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final int DifficultyLevel;

  const Difficulty({
    // ignore: non_constant_identifier_names
    required this.DifficultyLevel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: (DifficultyLevel >= 1) ? const Color.fromARGB(9999999999, 100, 100, 200) : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (DifficultyLevel >= 2) ? const Color.fromARGB(9999999999, 100, 100, 200) : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (DifficultyLevel >= 3) ? const Color.fromARGB(9999999999, 100, 100, 200) : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (DifficultyLevel >= 4) ? const Color.fromARGB(9999999999, 100, 100, 200) : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (DifficultyLevel >= 5) ? const Color.fromARGB(9999999999, 100, 100, 200) : Colors.blue[100],
        ),
      ],
    );
  }
}
