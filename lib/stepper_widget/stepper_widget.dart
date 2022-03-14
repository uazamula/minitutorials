import 'package:flutter/material.dart';

class MyStepperWidget extends StatefulWidget {
  const MyStepperWidget({Key? key}) : super(key: key);

  @override
  _MyStepperWidgetState createState() => _MyStepperWidgetState();
}

class _MyStepperWidgetState extends State<MyStepperWidget> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyStepperWidget)')),
      body: Center(
          child: Theme(
        data: Theme.of(context)
            .copyWith(colorScheme: ColorScheme.light(primary: Colors.red)),
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: currentStep,
          onStepTapped: (index) {
            setState(() {
              currentStep = index;
            });
          },
          onStepContinue: () {
            if (currentStep != 2) {
              setState(() {
                currentStep++;
              });
            }
          },
          onStepCancel: () {
            if (currentStep != 0) {
              setState(() {
                currentStep--;
              });
            }
          },
          steps: [
            Step(
              isActive: currentStep >= 0,
              title: Text('Step1'),
              content: Text('Content for Step1'),
            ),
            Step(
              isActive: currentStep >= 1,
              title: Text('Step2'),
              content: Text('Content for Step2'),
            ),
            Step(
              isActive: currentStep >= 2,
              title: Text('Step3'),
              content: Text('Content for Step3'),
            ),
          ],
        ),
      )),
    );
  }
}
