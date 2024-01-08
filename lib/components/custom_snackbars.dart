import 'package:flutter/material.dart';

class CustomSnackBars {
  CustomSnackBars._();
  static successSnackBar() => SnackBar(
        backgroundColor: Colors.green[400],
        content: const Text("Successfully Added to your bag !"),
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'Got It',
          onPressed: () {},
        ),
      );
  static failedSnackBar() => SnackBar(
        backgroundColor: Colors.red[400],
        content: const Text('You have added this items before !'),
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'Got It',
          onPressed: () {},
        ),
      );
}
