import 'package:flutter/material.dart';
import 'package:quiz_app_f4f/quizQuestionModel.dart';

const backgroundColor = Color.fromRGBO(45, 27, 3, 1);
const foregroundColor = Color.fromRGBO(244, 140, 6, 1);

List<QuizQuestionModel> quizQuestions = [
  QuizQuestionModel(
    question: "1. What is my favorite colour?",
     correctAnswer: "Yellow", 
     options: ["Red","Blue","Yellow","Pink"],
     ),

      QuizQuestionModel(
    question: "2. What kind of person,I'm in your eyes?",
     correctAnswer: "Brave", 
     options: ["Arrogant","Cool","Brave","Dashing"],
     ),

      QuizQuestionModel(
    question: "3. Which one is not my hobby?",
     correctAnswer: "Cooking", 
     options: ["Book reading","Walking","Playing","Cooking"],
     ),

      QuizQuestionModel(
    question: "4. What is my Room mate Name?",
     correctAnswer: "Dv", 
     options: ["Anu","Dv","Aditya","Zaidi"],
     ),
];

