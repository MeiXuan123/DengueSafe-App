/**
 * This class creates a list of General Frequently Asked Questions and Answers
 * 
 * @author: Aratrika Pal
 * 
 * 
 */

import 'QuestionsAnswers.dart';

class GeneralQuestionAnswerList {
  List<QuestionsAnswers> qA;
  GeneralQuestionAnswerList() {
    qA = [
      QuestionsAnswers(
          "What is dengue?", "A viral disease transmitted by mosquitoes."),
      QuestionsAnswers(
          "What precautions can I take?", "Wear mosquito Repellant."),
      QuestionsAnswers("What to do if I feel sick, and have fever?",
          "Book an appointment at Fullerton, NTU"),
      QuestionsAnswers("Is drinking water important if I'm sick?",
          "Drink lots of water to stay hydrated."),
    ];
  }

  List getList() {
    return qA;
  }
}
