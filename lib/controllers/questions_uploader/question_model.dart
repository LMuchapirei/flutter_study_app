

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