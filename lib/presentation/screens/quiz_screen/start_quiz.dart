import 'dart:async';

// import 'package:app_quiz/model/angket_model.dart';
// import 'package:app_quiz/presentation/widget/loading_soal.dart';
import 'package:flutter/material.dart';
import 'package:info_napza/common/routing/routes.dart';
import 'package:info_napza/model/kuis_model.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

class QuizScreenStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: size.height * .1),
          width: size.width ,
          height: size.height,
          color: Colors.amberAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('KUIS', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Colors.purple),),
              Container(
                width: size.width * .8,
                height: size.height * .4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),

                padding: EdgeInsets.all(size.width * .1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Kamu akan memulai Kuis dari Aplikasi Informasi NAPZA. Akan ada 20 Soal yang harus kamu jawab dan pilihlah jawaban yang menurutmu benar',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      
                    ),
                    textAlign: TextAlign.center,
                    ),
                    RaisedButton(

                      onPressed: (){
                        Navigator.of(context).pushNamed(Routes.kuisScreen);
                      },
                      color: Colors.lightBlueAccent,
                      child: Text('MULAI',style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Aplikasi\nInformasi\n',
                      style: TextStyle(fontSize: 25),
                      children: <TextSpan>[
                        
                        TextSpan(text: 'NAPZA', style: TextStyle(fontWeight: FontWeight.w700))
                      ])),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.05, left: size.width * 0.05),
              alignment: Alignment.center,
              height: 52,
              width: 52,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              // child: SvgPicture.asset('assets/icons/menu.svg'),
              child: Icon(
                IconData(58848,
                    fontFamily: 'MaterialIcons', matchTextDirection: true),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
