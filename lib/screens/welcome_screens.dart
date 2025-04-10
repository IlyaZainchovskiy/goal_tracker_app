import 'package:flutter/material.dart';

class WelcomeScreens extends StatelessWidget {
  const WelcomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Level Up',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: 'Roboto'),
          ),
          SizedBox(
            height: 5,
          ),
          Icon(
            Icons.timeline,
            size: 100,
            color: Color.fromARGB(255, 84, 42, 191),
          ),
        ],
      ),
    ));
  }
}
