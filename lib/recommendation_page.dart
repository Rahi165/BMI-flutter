import 'package:flutter/material.dart';

class RecommendationPage extends StatelessWidget {
  final String bmiCategory;

  RecommendationPage(this.bmiCategory);

  String getRecommendation() {
    switch (bmiCategory) {
      case "Underweight":
        return "You are underweight. It's important to gain weight in a healthy way. Eat a balanced diet rich in nutrients and calories. Include protein-rich foods like lean meats, fish, eggs, dairy, nuts, and seeds. Additionally, incorporate healthy fats, complex carbohydrates, and plenty of fruits and vegetables into your diet.";
      case "Normal":
        return "Congratulations! Your BMI is within the healthy range. To maintain your weight, continue to eat a balanced diet and engage in regular physical activity. Focus on eating nutrient-dense foods like fruits, vegetables, whole grains, lean proteins, and healthy fats.";
      case "Overweight":
        return "You are overweight. Focus on making gradual changes to your diet and lifestyle to lose weight in a healthy way. Eat a balanced diet that includes plenty of fruits, vegetables, lean proteins, and whole grains. Limit your intake of high-calorie and processed foods. Aim to engage in regular physical activity, such as walking, jogging, swimming, or cycling.";
      case "Obese":
        return "You are obese. It's important to take steps to lose weight and improve your health. Start by making small changes to your diet, such as reducing portion sizes and choosing healthier food options. Incorporate regular exercise into your routine, aiming for at least 150 minutes of moderate-intensity aerobic activity each week. Consider consulting with a healthcare professional or registered dietitian for personalized advice and support.";
      default:
        return "No recommendations available.";
    }
  }

  @override
  Widget build(BuildContext context) {
    String recommendation = getRecommendation();

    return Scaffold(
      appBar: AppBar(
        title: Text('Recommendations'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Recommendation for $bmiCategory',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: Text(
                    recommendation,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
