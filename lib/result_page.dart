import 'package:flutter/material.dart';
import 'quiz_page.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final int total;

  const ResultPage({super.key, required this.score, required this.total});

  String getMessage() {
    double percent = score / total;
    if (percent == 1.0) return "Parabéns! Você acertou tudo! 🎉";
    if (percent >= 0.6) return "Muito bem! Você mandou bem! 😄";
    return "Vamos tentar de novo e aprender mais? 🤗";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // LOGO: N+ com maçã acima do +
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

              const SizedBox(height: 30),

              // Mensagem final
              Text(
                getMessage(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Chewy',
                  fontSize: 50,
                  color: Colors.greenAccent.shade400,
                  fontWeight: FontWeight.bold,
                  shadows: const [
                    Shadow(
                      blurRadius: 5,
                      color: Colors.black,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Pontuação
              Text(
                'Pontuação: $score de $total',
                style: const TextStyle(
                  fontFamily: 'Chewy',
                  fontSize: 40,
                  color: Colors.blue,
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.black,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Botão Jogar Novamente
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const QuizPage()),
                  );
                },
                child: const Text(
                  'Jogar Novamente',
                  style: TextStyle(
                    fontFamily: 'Chewy',
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}