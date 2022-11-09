import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quiz_app_f4f/const.dart';
import 'package:quiz_app_f4f/playQuizScreen.dart';

class StartQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          "Start Quiz",
          style: TextStyle(
            color: backgroundColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: foregroundColor,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Quiz App",
              style: TextStyle(
                color: foregroundColor,
                fontSize: 50,
                fontWeight: FontWeight.w500,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayQuizScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: foregroundColor,
              ),
              child: Text("Start Quiz",
                  style: TextStyle(
                    color: backgroundColor,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
