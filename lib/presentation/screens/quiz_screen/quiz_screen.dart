import 'dart:async';

// import 'package:app_quiz/model/angket_model.dart';
// import 'package:app_quiz/presentation/widget/loading_soal.dart';
import 'package:flutter/material.dart';
import 'package:info_napza/model/kuis_model.dart';
import 'package:info_napza/presentation/widget/custom_dialog.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String _answer;
  int _indexSoalKe = 0;
  var finalAnswer = [];
  int a = 0;
  int b = 0;
  int c = 0;

  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showJawabanBenar(double height, double width) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          title: new Text(
            "Jawaban Salah",
          ),
          content: Container(
              height: height * 0.5,
              width: width * 0.9,
              child: Text(kuis[_indexSoalKe].penjelasan)),
          actions: <Widget>[
            new FlatButton(
              child: Text("Soal Selanjutnya"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

    void _showJawabanSalah(double height, double width) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          title: new Text(
            "Jawaban Salah",
          ),
          content: Container(
              height: height * 0.5,
              width: width * 0.9,
              child: Text(kuis[_indexSoalKe].penjelasan)),
          actions: <Widget>[
            new FlatButton(
              child: Text("Soal Selanjutnya"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialogNotChose() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            content: Text('Pilih jawaban dahulu!'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }

  bool checkJawaban(String jawaban) {
    if(jawaban == kuis[_indexSoalKe].jawabanBenar){
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            color: Colors.amber,
            child: Center(
                child: RichText(
              text: TextSpan(
                text: 'Soal ${kuis[_indexSoalKe].nomor}\n\n',
                style: const TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  fontSize: 32
                ),
                children: [
                  TextSpan(
                    text: kuis[_indexSoalKe].soal,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
              height: size.height * .65,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40))),
              child: ListView(
                children: <Widget>[
                  AnswerWidget(
                    choice: 'A',
                    answer: kuis[_indexSoalKe].jawabanA,
                    press: () {
                      setState(() {
                        _answer = 'a';
                      });
                    },
                    isActive: _answer == 'a',
                  ),
                  AnswerWidget(
                    choice: 'B',
                    answer: kuis[_indexSoalKe].jawabanB,
                    press: () {
                      setState(() {
                        _answer = 'b';
                      });
                    },
                    isActive: _answer == 'b',
                  ),
                  AnswerWidget(
                    choice: 'C',
                    answer: kuis[_indexSoalKe].jawabanC,
                    press: () {
                      setState(() {
                        _answer = 'c';
                      });
                    },
                    isActive: _answer == 'c',
                  ),
                  AnswerWidget(
                    choice: 'D',
                    answer: kuis[_indexSoalKe].jawabanD,
                    press: () {
                      setState(() {
                        _answer = 'd';
                      });
                    },
                    isActive: _answer == 'd',
                  ),
                  Container(
                    height: size.height * .07,
                    padding: EdgeInsets.symmetric(horizontal: size.width * .35),
                    margin: EdgeInsets.only(top: size.height * .02),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(30)
                    // ),
                    child: RaisedButton(
                      onPressed: () async {
                        if (_answer != null) {
                          // checkJawaban(_answer);
                          // _showJawabanBenar(size.height, size.width);
                          showDialog(context: context,
                          builder: (context) {
                            return CustomDialog(
                              title: 'Benr', 
                              content: kuis[_indexSoalKe].penjelasan, 
                              btnText: 'Soal Selanjutnya >>', 
                              // negativeBtnText: 'd', 
                              btnPressed: (){});
                          }
                          );
                        } else {
                          _showDialogNotChose();
                        }
                      },
                      color: Colors.lightBlue[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        'Next',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      
    );
  }
}

class AnswerWidget extends StatelessWidget {
  final String question;
  final String answer;
  final Function press;
  final bool isActive;
  final String choice;

  const AnswerWidget({
    Key key,
    this.press,
    this.question,
    this.answer,
    this.choice,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        height: size.height * .1,
        margin: EdgeInsets.symmetric(horizontal: size.width * .1)
            .copyWith(bottom: size.height * .02),
        padding: EdgeInsets.symmetric(horizontal: size.width * .05),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * .1),
            color: isActive ? Colors.blue[200] : Colors.grey[300]),
        child: Row(
          children: <Widget>[
            Text(
              '$choice.',
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: size.height * .03),
            ),
            SizedBox(
              width: size.width * .03,
            ),
            Expanded(
              child: Text(
                answer,
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: size.height * .028),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
