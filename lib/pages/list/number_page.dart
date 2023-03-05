import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class NumberPage extends StatelessWidget {
  const NumberPage({Key? key, required this.number}) : super(key: key);
  final int number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: FadeInUp(
            child: Text(
              number.toString(),
              style: const TextStyle(
                  color: Colors.red, fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
