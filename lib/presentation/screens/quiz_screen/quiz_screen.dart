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

  void _showSelesai() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CustomDialog(
              title: 'Selesai',
              content: 'Anda telah menyelesaikan soal kuis dengan jumlah benar ',
              btnText: 'Kembali ke Menu',
              // negativeBtnText: 'd',
              btnPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              });
        });
  }

  void _showPenjelasan() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CustomDialog(
              title: checkJawaban(_answer),
              content: kuis[_indexSoalKe].penjelasan,
              btnText: 'Soal Selanjutnya >>',
              // negativeBtnText: 'd',
              btnPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _indexSoalKe += 1;
                  _answer = null;
                });
              });
        });
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

  String checkJawaban(String jawaban) {
    if (jawaban == kuis[_indexSoalKe].jawabanBenar) {
      return 'Benar';
    } else {
      return 'Salah';
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: size.height * .05,
              right: size.width * .05,
              left: size.width * .05
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffffc101), Color(0xffff5728)]),
            ),
            height: size.height * .45,
            width: size.width,
            // color: Colors.amber,
            // child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'Soal ${kuis[_indexSoalKe].nomor}\n\n',
                  style: const TextStyle(
                      color: Color(0xff571243),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins-SemiBold',
                      fontSize: 32),
                  children: [
                    TextSpan(
                      text: kuis[_indexSoalKe].soal,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            // ),
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
                        _answer = 'A';
                      });
                    },
                    isActive: _answer == 'A',
                  ),
                  AnswerWidget(
                    choice: 'B',
                    answer: kuis[_indexSoalKe].jawabanB,
                    press: () {
                      setState(() {
                        _answer = 'B';
                      });
                    },
                    isActive: _answer == 'B',
                  ),
                  AnswerWidget(
                    choice: 'C',
                    answer: kuis[_indexSoalKe].jawabanC,
                    press: () {
                      setState(() {
                        _answer = 'C';
                      });
                    },
                    isActive: _answer == 'C',
                  ),
                  AnswerWidget(
                    choice: 'D',
                    answer: kuis[_indexSoalKe].jawabanD,
                    press: () {
                      setState(() {
                        _answer = 'D';
                      });
                    },
                    isActive: _answer == 'D',
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
                          if (_indexSoalKe == 19) {
                            _showSelesai();
                          } else {
                            _showPenjelasan();
                          }
                        } else {
                          _showDialogNotChose();
                        }
                      },
                      color: Color(0xff72ccc5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        'NEXT',
                        style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
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
