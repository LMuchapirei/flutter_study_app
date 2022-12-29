import 'package:flutter_study_app/controllers/question_paper/questions_controller.dart';

extension QuestionControllerExtension on QuestionsController {
  int get correctQuestionCount => allQuestions
      .where((currentQuestion) =>
          currentQuestion.selectedAnswer == currentQuestion.correctAnswer)
      .toList()
      .length;

  String get correctAnsweredQuestions {
    return "$correctQuestionCount out of ${allQuestions.length} are correct";
  }

  String get points {
    var points = (correctQuestionCount / allQuestions.length) *
        100 *
        (questionPaperModel.timeSeconds - remainingSeconds) /
        questionPaperModel.timeSeconds *
        100;
    return points.toStringAsFixed(2);
  }
}
