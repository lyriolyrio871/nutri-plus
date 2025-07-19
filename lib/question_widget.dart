import 'package:flutter/material.dart';
import 'question.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  final void Function(bool isCorrect) onAnswerSelected;

  const QuestionWidget({
    Key? key,
    required this.question,
    required this.onAnswerSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),

          // LOGO: Stack com maçã em cima do +
          Stack(
            alignment: Alignment.center,
            children: [
              // Logo N+
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontFamily: 'Chewy',
                    fontSize: 100,
                    shadows: [
                      Shadow(
                        blurRadius: 6,
                        color: Colors.black,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  children: [
                    TextSpan(
                      text: 'N',
                      style: TextStyle(color: Colors.greenAccent.shade700),
                    ),
                    TextSpan(
                      text: '+',
                      style: TextStyle(color: Colors.blueAccent.shade200),
                    ),
                  ],
                ),
              ),

              // Maçã posicionada acima do +
              Positioned(
                top: 0,
                // ignore: deprecated_member_use
                right: MediaQueryData.fromView(WidgetsBinding.instance.window).size.width / 2 - 105,
                child: const Text(
                  '🍎',
                  style: TextStyle(
                    fontSize: 36,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 50), // Espaço entre título e pergunta

          // Pergunta
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              question.questionText,
              style: TextStyle(
                fontFamily: 'Chewy',
                fontSize: 28,
                color: Colors.greenAccent.shade700,
                fontWeight: FontWeight.bold,
                shadows: const [
                  Shadow(
                    blurRadius: 5,
                    color: Colors.black,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 30), // Espaço entre pergunta e opções

          // Opções de resposta
          ...List.generate(
            question.answers.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Align(
                alignment: Alignment.center,
                child: IntrinsicWidth(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () =>
                        onAnswerSelected(index == question.correctIndex),
                    child: Text(
                      question.answers[index],
                      style: const TextStyle(
                        fontFamily: 'Chewy',
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}