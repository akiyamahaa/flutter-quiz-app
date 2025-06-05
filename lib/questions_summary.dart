import "package:flutter/material.dart";

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: data['user_answer'] == data['correct_answer']
                      ? Colors.green
                      : Colors.red,
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        data['question'] as String,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: TextStyle(color: Colors.lightBlueAccent),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: TextStyle(
                          color: data['user_answer'] == data['correct_answer']
                              ? Colors.lightBlueAccent
                              : Colors.red,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
