/**
 * This class is used to create a list of questions and answers, both general questions and specific questions
 * 
 * @author: Aratrika Pal
 * 
 */
import 'SpecificQuestionAnswerList.dart';
import 'GeneralQuestionAnswerList.dart';

class QuestionAnswerList {
  List generalQuestions = GeneralQuestionAnswerList().getList();
  List specificQuestions = SpecificQuestionAnswerList().getList();
  Map<String, List> dictQuestions;
  QuestionAnswerList() {
    dictQuestions = {
      "General": generalQuestions,
      "Specific": specificQuestions
    };
  }
  Map<String, List> getFAQs() {
    return dictQuestions;
  }
}
