import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MyPageRouteTransition extends StatefulWidget {
  const MyPageRouteTransition({Key? key}) : super(key: key);

  @override
  _MyPageRouteTransitionState createState() => _MyPageRouteTransitionState();
}

class _MyPageRouteTransitionState extends State<MyPageRouteTransition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyPageRouteTransition)')),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            ElevatedButton(
              child: Text('Left To Right'),
              onPressed: () => Navigator.of(context).push(
                PageTransition(
                  child: SecondPage(),
                  type: PageTransitionType.leftToRight,
                ),
              ),
            ),

            ElevatedButton(
              child: Text('Left To Right(Joined)'),
              onPressed: () => Navigator.of(context).push(
                PageTransition(
                  child: SecondPage(),
                  type: PageTransitionType.leftToRightJoined,
                  childCurrent: widget,
                  duration: Duration(milliseconds: 800),
                  reverseDuration: Duration(milliseconds: 1800),
                ),
              ),
            ),

            ElevatedButton(
              child: Text('Right To Left(Joined)'),
              onPressed: () => Navigator.of(context).push(
                PageTransition(
                  child: SecondPage(),
                  type: PageTransitionType.rightToLeftJoined,
                  childCurrent: widget,//this for StatelessWidget
                  duration: Duration(milliseconds: 800),
                  reverseDuration: Duration(milliseconds: 1800),
                ),
              ),
            ),

            ElevatedButton(
              child: Text('Fade'),
              onPressed: () => Navigator.of(context).push(
                PageTransition(
                  child: SecondPage(),
                  type: PageTransitionType.fade,
                ),
              ),
            ),

            ElevatedButton(
              child: Text('Scale(bottomCenter)'),
              onPressed: () => Navigator.of(context).push(
                PageTransition(
                  child: SecondPage(),
                  type: PageTransitionType.scale,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),

            ElevatedButton(
              child: Text('Size(bottomCenter)'),
              onPressed: () => Navigator.of(context).push(
                PageTransition(
                  child: SecondPage(),
                  type: PageTransitionType.size,
                  alignment: Alignment.topRight,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
        image: AssetImage('assets/images/brailka.jpg'),
      ),
    );
  }
}
