/**
 * This class is used to display frequently asked questions
 * 
 * @author Aratrika Pal, Loh Xinyi
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GeneralQuestionAnswerList.dart';
import 'QuestionAnswerList.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: FAQUI(),
  ));
}

class FAQUI extends StatefulWidget {
  @override
  _FAQUIState createState() => _FAQUIState();
}

class _FAQUIState extends State<FAQUI> {
  Map<String, List> qA = QuestionAnswerList().getFAQs();
  Widget faqTemplate(qA) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          decoration: new BoxDecoration(color: Color(0xFFCFD8DC)),
          padding: const EdgeInsets.fromLTRB(10.0, 4.0, 6.0, 4.0),
          child: Text(
            qA.question,
            style: GoogleFonts.openSansCondensed(
              textStyle: Theme.of(context).textTheme.display1,
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 3.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 4.0, 6.0, 4.0),
          child: Text(qA.answer,
              style: GoogleFonts.openSansCondensed(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 13,
                color: Colors.black,
                letterSpacing: 1.0,
                fontWeight: FontWeight.normal,
              )),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            'Frequently Asked Questions',
            style: TextStyle(
              letterSpacing: 1.0,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        body: ListView(scrollDirection: Axis.vertical, children: [
          Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Text(
                "General Questions",
                style: GoogleFonts.openSansCondensed(
                  textStyle: Theme.of(context).textTheme.display1,
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Column(
            children: qA["General"].map((qA) => faqTemplate(qA)).toList(),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Text(
                "Specific Questions",
                style: GoogleFonts.openSansCondensed(
                  textStyle: Theme.of(context).textTheme.display1,
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Column(
            children: qA["Specific"].map((qA) => faqTemplate(qA)).toList(),
          ),
        ]));
  }
}
