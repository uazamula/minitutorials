import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade600,
      body: Center(
        child: SpinKitCubeGrid(
          size: 140,
          // color: Colors.white,
          duration: Duration(seconds: 1),
          itemBuilder: (context, index) {
            final colors = [Colors.white, Colors.pinkAccent, Colors.yellow];
            final color = colors[index % colors.length];
            return DecoratedBox(
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            );
          },
        ),
      ),
    );
  }
}
