import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// liquid_swipe: ^2.1.1
class MyLiquidSwipe extends StatefulWidget {
  const MyLiquidSwipe({Key? key}) : super(key: key);

  @override
  _MyLiquidSwipeState createState() => _MyLiquidSwipeState();
}

class _MyLiquidSwipeState extends State<MyLiquidSwipe> {
  LiquidController? controller;
  int page = 0;

  @override
  void initState() {
    controller = LiquidController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        LiquidSwipe(
          // enableLoop: false,
          waveType: WaveType.liquidReveal,
          onPageChangeCallback: (page) {
            setState(() {});
          },
          liquidController: controller,
          enableSideReveal: true,
          slideIconWidget: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          pages: [
            Container(
              color: Colors.green,
              child: Center(
                child: Text('Page1'),
              ),
            ),
            Container(
              color: Colors.black38,// try to change it
              child: Center(
                child: Text('Page2'),
              ),
            ),
            Container(
              color: Colors.black12,// try to change it
              child: Center(
                child: Text('Page3', style: TextStyle(fontSize: 30),),//this text stacks on page 1(2)
              ),
            ),
          ],
        ),
        Positioned(
            bottom: 0,
            left: 16,
            right: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      controller!.jumpToPage(page: 2);
                    },
                    child: Text('Skip')),
                AnimatedSmoothIndicator(
                  activeIndex: controller!.currentPage,
                  // doesn't work properly in Chrome
                  count: 3,
                  effect: WormEffect(
                    spacing: 16,
                    dotColor: Colors.white54,
                    activeDotColor: Colors.white,
                  ),
                  onDotClicked: (index) {
                    controller!.animateToPage(page: index);
                  },
                ),
                TextButton(
                    onPressed: () {
                      page = controller!.currentPage + 1;
                      controller!.animateToPage(
                          page: page > 3 ? 0 : page, duration: 1000);
                    },
                    child: Text('Next')),
              ],
            ))
      ]),
    );
  }
}
