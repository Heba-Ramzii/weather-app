 import 'package:flutter/material.dart';

class FailureBody extends StatelessWidget {
  const FailureBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(
      'Something went wrong \n      please try again',
      style: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),));
  }
}
