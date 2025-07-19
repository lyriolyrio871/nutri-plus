import 'package:flutter/material.dart';
import 'quiz_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade600,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Stack para o título NUTRI+ com a maçã em cima do +
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Título NUTRI+
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Texto NUTRI com sombra
                    Text(
                      'NUTRI',
                      style: TextStyle(
                        fontFamily: 'Chewy',
                        fontSize: 130,
                        color: Colors.greenAccent.shade700,
                        shadows: const [
                          Shadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(4, 4),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Stack com o + e a maçã em cima
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        // Sinal de +
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Colors.blue, Colors.lightBlueAccent],
                          ).createShader(bounds),
                          child: const Text(
                            '+',
                            style: TextStyle(
                              fontFamily: 'Chewy',
                              fontSize: 130,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 10,
                                  color: Colors.black,
                                  offset: Offset(3, 3),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Emoji da maçã posicionado acima do +
                        const Positioned(
                          top: -55, // altura em cima do +
                          child: Text(
                            '🍎',
                            style: TextStyle(
                              fontSize: 60,
                              shadows: [
                                Shadow(
                                  blurRadius: 8,
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Subtítulo quiz com sombra
            const Text(
              'QUIZ',
              style: TextStyle(
                fontFamily: 'Chewy',
                fontSize: 85,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: Colors.black,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),

            // Botão INICIAR
            SizedBox(
              width: 220,
              height: 65,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const QuizPage()),
                  );
                },
                child: const Text(
                  'INICIAR',
                  style: TextStyle(
                    fontFamily: 'Chewy',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
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