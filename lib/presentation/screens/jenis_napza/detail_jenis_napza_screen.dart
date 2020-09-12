import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailJenisNapzaScreen extends StatelessWidget {
  final String name;
  final String napza;
  final List efek;
  final String picture;

  const DetailJenisNapzaScreen({Key key, this.napza, this.efek, this.name, this.picture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var efekList = <Widget>[];
    for (var text in efek) {
      efekList.add(UnorderedListItem(text));
      efekList.add(SizedBox(
        height: 5.0,
      ));
    }

    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
            height: size.height * .45,
            child: Image.asset(
              picture,
              width: size.width,
              fit: BoxFit.fill,
            ),
          ),
        Container(
          padding: EdgeInsets.only(bottom: size.height * 0.13),
          height: size.height * .45,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
            ),
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
                IconData(58848, fontFamily: 'MaterialIcons', matchTextDirection: true)
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.02, horizontal: size.width * 0.07),
            height: size.height * 0.65,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: 'Apa sih ',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                        children: <TextSpan>[
                          TextSpan(
                              text: name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black)),
                          TextSpan(text: ' itu ?')
                        ]),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    napza,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Efek ',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                        children: <TextSpan>[
                          TextSpan(
                              text: name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black)),
                        ]),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Column(
                    children: efekList,
                  ),
                ],
              ),
            ),
          ),
        ),
        //  Column(
        //    children: <Widget>[
        //     Padding(
        //       padding: EdgeInsets.all(32),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: <Widget>[
        //           SizedBox(height: size.height * 0.3,),
        //           SizedBox(
        //             width:size.width * 0.9,
        //             height: size.height * 0.5,
        //             child: SingleChildScrollView(
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: <Widget>[
        //                   RichText(
        //                     text: TextSpan(
        //                       text: 'Apa sih ',
        //                       style: Theme.of(context)
        //                           .textTheme
        //                           .headline4
        //                           .copyWith(
        //                               fontWeight: FontWeight.w600,),
        //                       children: <TextSpan>[
        //                         TextSpan(
        //                           text: name,
        //                           style : Theme.of(context)
        //                           .textTheme
        //                           .headline4
        //                           .copyWith(
        //                               fontWeight: FontWeight.w800, color: Colors.black)
        //                         ),
        //                         TextSpan(
        //                           text: ' itu ?'
        //                         )
        //                       ]
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     height: size.height * 0.01,
        //                   ),
        //                   Text(napza,
        //                     style: TextStyle(
        //                       fontSize: 16
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     height: size.height * 0.03,
        //                   ),
        //                   RichText(
        //                     text: TextSpan(
        //                       text: 'Efek ',
        //                       style: Theme.of(context)
        //                           .textTheme
        //                           .headline4
        //                           .copyWith(
        //                               fontWeight: FontWeight.w600,),
        //                       children: <TextSpan>[
        //                         TextSpan(
        //                           text: name,
        //                           style : Theme.of(context)
        //                           .textTheme
        //                           .headline4
        //                           .copyWith(
        //                               fontWeight: FontWeight.w800, color: Colors.black)
        //                         ),
        //                       ]
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     height: size.height * 0.01,
        //                   ),
        //                   Column(
        //                     children: efekList,
        //                   ),

        //                 ],
        //               ),
        //             )
        //           ),
        //         ],
        //       ),
        //     ),
        //    ]
        //  ),
        //  Container(
        //    width: size.width,
        //    height: size.height * 0.3,
        //    child: Image.asset(image)
        //   )
      ],
    ));
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
        Text(
          "  • ",
          style: TextStyle(fontSize: 20),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
