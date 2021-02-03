/**
 * This class creates a list of Specific Frequently Asked Questions and Answers
 * 
 * @author: Aratrika Pal
 * 
 * 
 */

import 'QuestionsAnswers.dart';

class SpecificQuestionAnswerList {
  List<QuestionsAnswers> qA;
  SpecificQuestionAnswerList() {
    qA = [
      QuestionsAnswers("Who are Admin Users ?",
          "NTU Staff, Fullerton Staff or staff from Jurong Hospital"),
      QuestionsAnswers(
          "Where can I see Campus cases?", "Visit Hotspot Map Page."),
      QuestionsAnswers("Can I see cases all over Singapore?",
          "Yes, click on SG Stats on the Home Page"),
      QuestionsAnswers("Can I report any issues?",
          "This feature will be available in a future upgrade"),
    ];
  }

  List getList() {
    return qA;
  }
}
