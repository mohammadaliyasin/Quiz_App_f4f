import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz_app_f4f/const.dart';
import 'package:quiz_app_f4f/quizQuestionModel.dart';
import 'package:quiz_app_f4f/resultScreen.dart';

class PlayQuizScreen extends StatefulWidget {
  const PlayQuizScreen({super.key});

  @override
  State<PlayQuizScreen> createState() => _PlayQuizScreenState();
}

class _PlayQuizScreenState extends State<PlayQuizScreen> {
  final PageController pageController = PageController();
  bool isAnswerLocked = false;
  int currentIndex = 0, correctAnswers = 0, wrongAnswers = 0;
  String correctAnswer = "", selectedAnswer = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: backgroundColor),
        title: Text(
          "Play Quiz",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: backgroundColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: foregroundColor,
      ),
      body: PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: quizQuestions.length,
        itemBuilder: ((context, index) {
          QuizQuestionModel model = quizQuestions[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    model.question,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: List.generate(
                    model.options.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isAnswerLocked = true;
                            selectedAnswer = model.options[index];
                            correctAnswer = model.correctAnswer;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: foregroundColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: selectedAnswer == model.options[index]
                                ? foregroundColor
                                : backgroundColor,
                          ),
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Text(
                              model.options[index],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (isAnswerLocked) {
            if (selectedAnswer == correctAnswer) {
              correctAnswers++;
            } else {
              wrongAnswers++;
            }

            currentIndex++;

            if (currentIndex != quizQuestions.length) {
              pageController.jumpToPage(currentIndex);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(correctAnswers: correctAnswers,wrongAnswers: wrongAnswers,),
                ),
              );
            }

            print("Correct Answers:$correctAnswers");
            print("Wrong Answers:$wrongAnswers");
          } else {
            print("Please select any Option");
          }
        },
        child: Container(
          color: foregroundColor,
          height: 70,
          alignment: Alignment.center,
          child: Text(
            "Next",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: backgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
