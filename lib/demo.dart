import 'package:flutter/material.dart';
import 'recommendation_page.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _result = 0.0;
  String _bmiCategory = '';
  Gender _selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedGender = Gender.male;
                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.male,
                          color: _selectedGender == Gender.male ? Colors.blue : Colors.grey,
                          size: 40.0,
                        ),
                        Text(
                          'Male',
                          style: TextStyle(
                            color: _selectedGender == Gender.male ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedGender = Gender.female;
                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.female,
                          color: _selectedGender == Gender.female ? Colors.pink : Colors.grey,
                          size: 40.0,
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                            color: _selectedGender == Gender.female ? Colors.pink : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'height in cm',
                icon: Icon(Icons.trending_up),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'weight in kg',
                icon: Icon(Icons.line_weight),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
              ),
              onPressed: calculateBMI,
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 15),
            Text(
              _result == 0.0 ? "Enter Value" : "BMI: ${_result.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                if (_bmiCategory.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecommendationPage(_bmiCategory),
                    ),
                  );
                }
              },
              child: Text(
                _bmiCategory.isEmpty ? "" : "Category: $_bmiCategory (tap for recommendations)",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 19.4,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;

    setState(() {
      _result = result;
      if (_selectedGender == Gender.female) {
        // Adjusting BMI calculation for females
        _result *= 0.95;
      }
      if (_result < 18.5) {
        _bmiCategory = "Underweight";
      } else if (_result >= 18.5 && _result < 25) {
        _bmiCategory = "Normal";
      } else if (_result >= 25 && _result < 30) {
        _bmiCategory = "Overweight";
      } else {
        _bmiCategory = "Obese";
      }
    });
  }
}

enum Gender { male, female }
