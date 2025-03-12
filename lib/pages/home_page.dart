import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: const Center(
        child: Text(
          "Welcome",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
