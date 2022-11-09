import 'package:flutter/material.dart';
import 'package:quiz_app_f4f/const.dart';
import 'package:quiz_app_f4f/playQuizScreen.dart';

class ResultScreen extends StatelessWidget {
  int correctAnswers, wrongAnswers;

  ResultScreen({
    super.key,
    required this.correctAnswers,
    required this.wrongAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: foregroundColor,
        iconTheme: IconThemeData(color: backgroundColor),
        title: Text(
          "Result",
          style: TextStyle(
            color: backgroundColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                answerTab("Correct Answer", correctAnswers),
                answerTab("Wrong Answer", wrongAnswers),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayQuizScreen(),
                    ),
                    (route) => false);
              },
              style: ElevatedButton.styleFrom(primary: foregroundColor),
              child: Text(
                "Restart Quiz",
                style: TextStyle(
                  color: backgroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget answerTab(String title, int value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "$value",
          style: TextStyle(
            color: foregroundColor,
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
