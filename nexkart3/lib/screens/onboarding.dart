import 'package:flutter/material.dart';
import 'package:nexkart3/screens/onboarding_skip.dart';
import 'package:nexkart3/screens/loginpage.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              OnboardingScreen1(
                image: 'assets/images/sammy-line-searching.gif',
                title: 'Welcome to Nexkart',
                subTitle:
                    'shop smart , save more\n get the best deals from your local \n sunday exhibitions now available every day!',
              ),
              OnboardingScreen1(
                image: 'assets/images/sammy-line-shopping.gif',
                title: 'Exclusive Local Deals',
                subTitle:
                    'handpicked offers just for you! \n discover unique products from local sellers \n at discounted rates Swipe,exploren and grab\n your favourites before theyre gone',
              ),
              OnboardingScreen1(
                image: 'assets/images/sammy-line-delivery.gif',
                title: 'Lets Get Started !',
                subTitle:
                    'Your Marketplace, Your Rules! \n create an account, start browsing and enjoy \n seamless shopping with Nexkart , Bringing\n the market to your fingertips!',
              ),
            ],
          ),

          OnboardingSkip(),

          Positioned(
            bottom: 30,
            left: 300,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Loginpage()),
                );
              },
              child: Icon(Icons.arrow_forward, color: Colors.white),

              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Image.asset(image, width: 500, height: 500),
          Text(
            title,

            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,

              fontFamily: 'MAGNETOB',
            ),

            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 50),
          Text(
            subTitle,

            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
