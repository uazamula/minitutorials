import 'package:flutter/material.dart';
import 'package:minitutorials/onboarding_screen_UI/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyOnBoardingScreenUI extends StatefulWidget {
  const MyOnBoardingScreenUI({Key? key}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<MyOnBoardingScreenUI> {
  bool isLastPage = false;
  final controller = PageController();
  final lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
      'nisi ut aliquip ex ea commodo consequat. '
      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore '
      'eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, '
      'sunt in culpa qui officia deserunt mollit anim id est laborum.';
  final loremShort = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Onboarding Screen UI)')),
      body: Container(
        padding: EdgeInsets.only(bottom: 100),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'assets/images/buddha.jpg',
              title: 'REDUCE',
              subtitle: loremShort,
            ),
            SingleChildScrollView(
              child: buildPage(
                color: Colors.blue.shade100,
                urlImage: 'assets/images/alarm.png',
                title: 'RECYCLE',
                subtitle: loremShort,
              ),
            ),
            Container(
              color: Colors.green,
              child: Text('Page 3'),
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              onPressed: () async {
                //navigate directly to home page
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Get Started', style: TextStyle(fontSize: 24)))
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => controller.jumpToPage(2),
                      child: const Text('SKIP')),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                          spacing: 16,
                          dotColor: Colors.black26,
                          activeDotColor: Colors.teal.shade700),
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () => controller.nextPage(
                          duration:
                              const Duration(seconds: 0, milliseconds: 500),
                          curve: Curves.easeInOut),
                      child: const Text('NEXT')),
                ],
              ),
            ),
    );
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(
              height: 64,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.teal.shade700,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      );
}
