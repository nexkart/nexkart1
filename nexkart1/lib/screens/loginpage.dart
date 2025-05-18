import 'package:flutter/material.dart';
import 'package:nexkart1/main.dart';
import 'package:nexkart1/screens/homepage.dart';
import 'package:nexkart1/screens/otppage.dart';

void main() {
  runApp(MyApp());
}

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Top left bubble
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/bubble_2.png', // Your top bubble image
                width: 200,
              ),
            ),

            // Bottom right bubble
            Positioned(
              top: 400,
              bottom: 20,
              right: -62,
              child: Image.asset(
                'assets/images/bubble_1.png', // Your bottom bubble image
                width: 200,
              ),
            ),
            // Skip Button
            Positioned(
              top: 20,
              right: 20,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.deepPurple),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // your logic
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text(
                  "Skip",
                  style: TextStyle(fontFamily: 'LeagueSpartan-Bold'),
                ), // moved to last
              ),
            ),
            // Main Content
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Group_1000004649.png', // replace with your actual asset
                        height: 100,
                      ),
                      SizedBox(height: 0),
                      Text(
                        'Nexkart',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          foreground:
                              Paint()
                                ..shader = LinearGradient(
                                  colors: <Color>[
                                    const Color.from(
                                      alpha: 1,
                                      red: 0.659,
                                      green: 0.588,
                                      blue: 0.969,
                                    ),
                                    const Color.fromRGBO(90, 79, 143, 1),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ).createShader(
                                  Rect.fromLTWH(
                                    0.0,
                                    0.0,
                                    200.0,
                                    70.0,
                                  ), // Required to convert gradient to shader
                                ),
                          fontFamily: 'MAGNETOB', // or custom font
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Login or signup",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LeagueSpartan-Bold',
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Text("+91 |", style: TextStyle(fontSize: 16)),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: "Enter Phone Number",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "- OR Continue with -",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Google
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFFCF3F6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.deepPurpleAccent,
                                  blurRadius: 2,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                10,
                              ), // Controls icon size
                              child: Image.asset('assets/images/google_1.png'),
                            ),
                          ),
                          SizedBox(width: 20),

                          // Facebook
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFFCF3F6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.deepPurpleAccent,
                                  blurRadius: 2,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset('assets/images/f_1.png'),
                            ),
                          ),
                          SizedBox(width: 20),

                          // Apple
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFFCF3F6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.deepPurpleAccent,
                                  blurRadius: 2,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset('assets/images/apple_1.png'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(155, 135, 245, 1),
                              Color.fromRGBO(90, 79, 143, 1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Otppage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
