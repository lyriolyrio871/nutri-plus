import 'package:flutter/material.dart';
import 'question_data.dart';
import 'result_page.dart';
import 'question_widget.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  int _score = 0;

  void _answerQuestion(bool isCorrect) {
    if (isCorrect) _score++;

    if (_currentIndex < questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultPage(score: _score, total: questions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[_currentIndex];
    return Scaffold(
      backgroundColor: Colors.red, // Azul mais forte
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: QuestionWidget(
            question: currentQuestion,
            onAnswerSelected: _answerQuestion,
          ),
        ),
      ),
    );
  }
}