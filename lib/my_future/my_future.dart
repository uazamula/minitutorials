import 'package:flutter/material.dart';

class MyFuture extends StatefulWidget {
  const MyFuture({Key? key}) : super(key: key);

  @override
  _MyFutureState createState() => _MyFutureState();
}

class _MyFutureState extends State<MyFuture> {
  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyFuture)'),
        actions: [
          IconButton(
              onPressed: () => controller.previousPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
              icon: Icon(Icons.arrow_left)),
          IconButton(
              onPressed: () => controller.nextPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
              icon: Icon(Icons.arrow_right)),
        ],
      ),
      body: PageView(
        // physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          Center(
            child: ElevatedButton(
              child: Text('Get data'),
              onPressed: () async {
                print('1. task');

                //network request emulation to get current weather
                await Future.delayed(Duration(seconds: 3), () {
                  print('2. task: if Weather Sunny?');
                });

                print('3. task: if sunny go to walk');

                String weather = await Future.delayed(Duration(seconds: 3), () {
                  return 'Raining';
                });
                print('4. task ($weather)');

                final newWeather = await getData();
                print('5. task ($newWeather)');
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<String> getData() async {
    await Future.delayed(Duration(seconds: 3));
    return 'Raining';
  }
}
