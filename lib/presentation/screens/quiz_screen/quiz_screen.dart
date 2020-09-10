import 'dart:async';

// import 'package:app_quiz/model/angket_model.dart';
// import 'package:app_quiz/presentation/widget/loading_soal.dart';
import 'package:flutter/material.dart';
import 'package:info_napza/model/kuis_model.dart';
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

  void _showDialog(double height, double width) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          title: new Text("Jawaban Salah",),
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: <Widget>[
        ClipPath(
            clipper: MyClipper(),
            child: Container(
                height: size.height * .40,
                padding: EdgeInsets.symmetric(horizontal: size.width * .1),
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xff3383CD), Color(0xFF88da89)])),
                child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(size.height * .04),
                        height: size.height * .1,
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: 'Soal no ${kuis[_indexSoalKe].nomor}\n',
                                style: TextStyle(fontSize: 20),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '${kuis[_indexSoalKe].nomor} - 15',
                                      style: TextStyle(fontSize: 14))
                                ]))),
                    Text(
                      kuis[_indexSoalKe].soal,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ))),
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
            margin: EdgeInsets.only(top: size.height * .03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: () async {
                    if (_answer != null) {
                      // Timer timer = Timer(Duration(milliseconds: 700), () {
                      //   Navigator.of(context, rootNavigator: true).pop();
                      // });
                      // await showDialog(
                      //   barrierDismissible: true,
                      //   context: context,
                      //   builder: (_) => LoadingOverlay(
                      //     asset: 'assets/images/loading_success_error_2.flr',
                      //     animate: 'loading',
                      //   ),
                      // ).then((value) {
                      //   timer?.cancel();
                      //   timer = null;
                      // });

                      print(_indexSoalKe);

                      // setState(() {
                      //   // loading = true;
                      //   finalAnswer.add(_answer);
                      //   print(finalAnswer);
                      //   _answer == "a"
                      //       ? a = a + 1
                      //       : _answer == "b" ? b = b + 1 : c = c + 1;
                      //   print("a = $a, b= $b, c= $c");
                      //   _indexSoalKe == 14
                      //       ? _showDialog(size.height)
                      //       : _indexSoalKe = _indexSoalKe + 1;
                      //   _answer = null;
                      // });
                      _showDialog(size.height, size.width);
                    } else {
                      _showDialogNotChose();
                    }
                  },
                  color: Color(0xfff0c6b5),
                  child: Text('Next'),
                ),
              ],
            ))
      ],
    ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
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
            color: isActive ? Color(0xff88da89) : Colors.grey[400]),
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

class LinearSales {
  final String jenis;
  final int jumlah;
  final Color color;

  LinearSales(this.jenis, this.jumlah, this.color);
}
