class Question {
  final String questionText;
  final List<String> answers;
  final int correctIndex;

  Question({
    required this.questionText,
    required this.answers,
    required this.correctIndex,
  });
}