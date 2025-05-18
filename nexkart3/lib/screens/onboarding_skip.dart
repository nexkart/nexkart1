import 'package:flutter/material.dart';
// Replace 'login_page.dart' with the actual file name where Loginpage is defined

import 'package:nexkart3/screens/loginpage.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 320,

      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Loginpage()),
          );
        },
        child: Text(
          'Skip',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
    );
  }
}
