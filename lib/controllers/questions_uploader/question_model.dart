

import 'dart:io';

class QuestionSubject {
   String? subject;
   int? numberOfQuestions;

   QuestionSubject({
     this.numberOfQuestions,
     this.subject});


  QuestionSubject.fromJson(Map<String,dynamic> json){
    numberOfQuestions = json["numberOfQuestions"];
    subject = json["subject"];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = {};
    data["subject"] = subject;
    data["numberOfQuestions"] = numberOfQuestions;
    return data;
  }

  @override
  String toString() {
    return { "subject":subject, "numberOfQuestions":numberOfQuestions}.toString();
  }
}

class QuestionModel {
  String? id;
  String? question;
  List<AnswerModel>? answers;
  String? correctAnswer;

  QuestionModel({this.id, this.question, this.answers, this.correctAnswer});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    if (json['answers'] != null) {
      answers = <AnswerModel>[];
      json['answers'].forEach((v) {
        answers!.add(new AnswerModel.fromJson(v));
      });
    }
    correctAnswer = json['correct_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    data['correct_answer'] = this.correctAnswer;
    return data;
  }
}


class AnswerModel {
   String? identifier;
   String? answer;
   File? image;

  AnswerModel({  this.answer,  this.identifier, this.image});

  AnswerModel.fromJson(Map<String,dynamic> json){
    answer = json["answer"];
    identifier = json["identifier"];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = {};
    data["answer"] = answer;
    data["identifier"] = identifier;
    return data;
  }

  @override
  String toString() {
    return { "answer":answer,"identifier":identifier }.toString();
  }
}

