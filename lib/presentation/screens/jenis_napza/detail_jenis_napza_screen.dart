import 'package:flutter/material.dart';

class DetailJenisNapzaScreen extends StatelessWidget {
  final String napza;
  final List efek;

  const DetailJenisNapzaScreen({Key key, this.napza, this.efek,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var efekList = <Widget>[];
    for(var text in efek) {
      efekList.add(UnorderedListItem(text));
      efekList.add(SizedBox(height: 5.0,));
    }

    return Scaffold(
       body: SafeArea(
         child: Stack(
           children: <Widget>[
             Column(
               children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: size.height * 0.3,),

                      // Text(
                      //   'Audio Learner',
                      //   style: TextStyle(
                      //     fontFamily: 'TTCommons',
                      //     fontSize: 52,
                      //     fontWeight: FontWeight.w500
                      //   ),
                      //   textAlign: TextAlign.left,
                      // ),
                      Divider(color: Colors.black38),
                      SizedBox(
                        width:size.width * 0.9,
                        height: size.height * 0.5,
                        child: SingleChildScrollView(
                          // child: Text(
                          //   // InfoGayaBelajarString.ciri_ciri,
                          //   style: TextStyle(
                          //     fontFamily: 'TTCommons',
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.w400
                          //   ),
                          //   textAlign: TextAlign.left,
                          // ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(napza,
                                style: TextStyle(
                                  fontSize: 16
                                ),     
                              ),
                              // Text('Ciri-ciri gaya belajar visual',
                              //   style: TextStyle(
                              //     fontSize: 16
                              //   ),
                              // ),
                              Column(
                                children: efekList,
                              ),
                              
                            ],
                          ),
                        )
                      ),
                      Divider(color: Colors.black38,)
                    ],
                  ),
                ),
               ]
             ),
            //  Container(
            //    width: size.width,
            //    height: size.height * 0.3,
            //    child: Image.asset(image)
            //   )
           ],
         )
      )
    );
  }

}


class UnorderedListItem extends StatelessWidget {
  UnorderedListItem(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("   • "),
        Expanded(
          child: Text(text),
        ),
      ],
    );
  }
}