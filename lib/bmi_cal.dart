import 'package:bmi_cal/components.dart';
import 'package:flutter/material.dart';

class BmiCal extends StatefulWidget {
  const BmiCal({super.key});

  @override
  State<BmiCal> createState() => _BmiCalState();
}

class _BmiCalState extends State<BmiCal> {
  bool isMale = false;
  int height = 140;
  int weight = 70;
  int age = 25;
  double bmi = 0.0;

  double calculateBMI(weight, height) {
    return weight / ((height / 100) * (height / 100));
  }

  Color getBmiColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.blue; // Underweight
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return Colors.green; // Normal weight
    } else if (bmi >= 25 && bmi < 29.9) {
      return Colors.yellow; // Overweight
    } else {
      return Colors.red; // Obesity
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 13, 15, 15),
      ),
      backgroundColor: const Color.fromARGB(255, 13, 15, 15),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      isMale = true;

                      var bmiValue = calculateBMI(weight, height);
                      setState(() {
                        bmi = bmiValue;
                      });
                    },

                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration:
                          isMale
                              ? kSelectedTileBorderDecoration
                              : kTileBorderDecoration,

                      child: Column(
                        children: [
                          Icon(
                            Icons.male,
                            size: 50,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          Text(
                            "Male",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      isMale = false;

                      var bmiValue = calculateBMI(weight, height);
                      setState(() {
                        bmi = bmiValue;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration:
                          !isMale
                              ? kSelectedTileBorderDecoration
                              : kTileBorderDecoration,

                      child: Column(
                        children: [
                          Icon(Icons.female, size: 50, color: Colors.white),
                          Text(
                            "Female",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 35, 48, 54),
                borderRadius: BorderRadius.circular(5),
              ),

              child: Column(
                children: [
                  SizedBox(height: 8),
                  Text(
                    'Height',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$height",

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        ' cm',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  Slider(
                    min: 60,
                    max: 250,
                    divisions: 150,
                    value: height.toDouble(),
                    onChanged: (value) {
                      height = value.toInt();

                      var bmiValue = calculateBMI(weight, height);
                      setState(() {
                        bmi = bmiValue;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 35, 48, 54),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$weight",
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              ' kg',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              elevation: 0,
                              shape: ShapeBorder.lerp(
                                CircleBorder(),
                                CircleBorder(),
                                0.5,
                              ),
                              onPressed: () {
                                if (weight > 25) weight--;

                                var bmiValue = calculateBMI(weight, height);
                                setState(() {
                                  bmi = bmiValue;
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                            FloatingActionButton(
                              elevation: 0,
                              shape: ShapeBorder.lerp(
                                CircleBorder(),
                                CircleBorder(),
                                0.5,
                              ),
                              onPressed: () {
                                if (weight < 200) weight++;

                                var bmiValue = calculateBMI(weight, height);
                                setState(() {
                                  bmi = bmiValue;
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 35, 48, 54),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$age",
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              elevation: 0,
                              shape: ShapeBorder.lerp(
                                CircleBorder(),
                                CircleBorder(),
                                0.5,
                              ),
                              onPressed: () {
                                if (age > 10) age--;

                                var bmiValue = calculateBMI(weight, height);
                                setState(() {
                                  bmi = bmiValue;
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                            FloatingActionButton(
                              elevation: 0,
                              shape: ShapeBorder.lerp(
                                CircleBorder(),
                                CircleBorder(),
                                0.5,
                              ),
                              onPressed: () {
                                if (age < 110) age++;

                                var bmiValue = calculateBMI(weight, height);
                                setState(() {
                                  bmi = bmiValue;
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),

            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 35, 48, 54),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Your BMI is ${bmi.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24, color: getBmiColor(bmi)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
