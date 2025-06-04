class QuizQuestions {
  const QuizQuestions({required this.text, required this.answers});
  final String text;
  final List<String> answers;

  List<String> getShuffedAnswers() {
    final shuffled = List<String>.from(answers);
    shuffled.shuffle();
    return shuffled;
  }
}
