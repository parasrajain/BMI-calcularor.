import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double height = 170.0;
  double weight = 70.0;
  double bmi = 0.0;

  void calculateBMI() {
    setState(() {
      bmi = (weight / ((height / 100) * (height / 100)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter your height (in cm):',
              style: TextStyle(fontSize: 18.0),
            ),
            Slider(
              value: height,
              onChanged: (newHeight) {
                setState(() {
                  height = newHeight;
                });
              },
              min: 100.0,
              max: 250.0,
            ),
            Text(
              height.toStringAsFixed(1) + ' cm',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Enter your weight (in kg):',
              style: TextStyle(fontSize: 18.0),
            ),
            Slider(
              value: weight,
              onChanged: (newWeight) {
                setState(() {
                  weight = newWeight;
                });
              },
              min: 30.0,
              max: 200.0,
            ),
            Text(
              weight.toStringAsFixed(1) + ' kg',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
              },
              child: Text(
                'Calculate BMI',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Your BMI is: ${bmi.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
