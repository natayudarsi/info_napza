import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:info_napza/category_card.dart';
import 'package:info_napza/common/routing/routes.dart';
import 'package:info_napza/model/info_napza.dart';
import 'package:info_napza/model/jenis_napza_model.dart';
import 'package:info_napza/presentation/screens/jenis_napza/detail_jenis_napza_screen.dart';
import 'package:info_napza/presentation/screens/jenis_napza/jenis_list_item.dart';

class JenisNapzaScreen extends StatefulWidget {
  final String jenis;

  const JenisNapzaScreen({Key key, this.jenis}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _JenisNapzaScreenState();
}

class _JenisNapzaScreenState extends State<JenisNapzaScreen> {
  List<String> images;
  List<String> imagesNarkotika = [
    'assets/images/ganja.jpeg',
    'assets/images/morphine-pills.jpg',
    'assets/images/kokain.jpg'
  ];

  List<String> imagesPsikotropika = [
    'assets/images/ekstasi.png',
    'assets/images/clobazam.jpg',
    'assets/images/phenorbabital.jpg',
    'assets/images/amfetamin.jpg'
  ];

  List<String> imagesZatAdiktif = [
    'assets/images/wiski.jpg',
    'assets/images/anggur-kolosom.jpg',
    'assets/images/bir.jpg',
    'assets/images/arak.jpg'
  ];

  List<String> nama;
  List<String> narkotika = ['Ganja', 'Morfin', 'Kokain'];
  List<String> psikotropika = [
    'Ekstasy',
    'Clobazam',
    'Phenorbabital',
    'Amfetamin'
  ];
  List<String> zatAdiktif = ['Wisky', 'Anggur Kolosom', 'Bir', 'Arak'];

  List<String> detail;
  List<String> detailNarkotika = [ganja, morfin, cocain];
  List<String> detailPsikotropika = [
    ekstasy,
    clobazam,
    phenorbabital,
    amfetamin
  ];
  List<String> detailZatAdiktif = [wiski, anggurKolosom, bir, arak];

  List<dynamic> efek;
  List<dynamic> efekNarkotika = [efekGanja, efekMorfin, efekCocain];
  List<dynamic> efekPsikotropika = [
    efekEkstasy,
    efekClobazam,
    efekPhenorbabital,
    efekAmfetamin
  ];

  List<dynamic> efekZatAdiktif = [
    efekWiski,
    efekAnggurKolosom,
    efekBir,
    efekArak
  ];

  String napza;
  List kategoriNapza;

  @override
  void initState() {
    super.initState();
    if (widget.jenis == 'Narkotika') {
      images = imagesNarkotika;
      nama = narkotika;
      detail = detailNarkotika;
      efek = efekNarkotika;
      napza = InfoNapza.narkoba;
      kategoriNapza = InfoNapza.jenisNarkoba;
    } else if (widget.jenis == 'Psikotropika') {
      images = imagesPsikotropika;
      nama = psikotropika;
      detail = detailPsikotropika;
      efek = efekPsikotropika;
      napza = InfoNapza.psikotropika;
      kategoriNapza = InfoNapza.jenisPsikotropika;
    } else {
      images = imagesZatAdiktif;
      nama = zatAdiktif;
      detail = detailZatAdiktif;
      efek = efekZatAdiktif;
      napza = InfoNapza.zatAdiktif;
      kategoriNapza = InfoNapza.jenisZatAdiktif;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var efekList = <Widget>[];
    for (var text in kategoriNapza) {
      print(text);
      efekList.add(UnorderedListItem(text));
      efekList.add(SizedBox(
        height: 5.0,
      ));
    }

    var jenisListView = <Widget>[];
    for (var i = 0; i < nama.length; i++){
      print(i);
      jenisListView.add(JenisListItem(detail[i], efek[i], nama[i], images[i]));
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .5,
            color: Colors.pink[100],
            child: Image.asset(
              'assets/images/Artwork-2.jpg',
              width: size.width,
              fit: BoxFit.fill,
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
                child: Icon(const IconData(58848,
                    fontFamily: 'MaterialIcons', matchTextDirection: true)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.02,
                    horizontal: size.width * 0.07),
                height: size.height * 0.65,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      RichText(
                          text: TextSpan(
                              text: '${widget.jenis}\n',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  // fontWeight: FontWeight.bold,

                                  fontFamily: 'Poppins-SemiBold'),
                              children: <TextSpan>[
                            TextSpan(
                                text: napza,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                ))
                          ])),
                      // Text(widget.jenis),
                      // Text(InfoNapza.narkoba),
                      Column(
                        children: efekList,
                      ),
                      Column(
                        children: jenisListView,
                      )
                      // Expanded(
                      //   child: ListView.builder(
                      //       itemCount: nama.length,
                      //       itemBuilder: (context, index) {
                      //         return Container(
                      //           margin: EdgeInsets.symmetric(
                      //               vertical: size.height * 0.01),
                      //           height: size.height * .1,
                      //           width: size.width,
                      //           decoration: BoxDecoration(
                      //               color: Colors.black,
                      //               borderRadius: BorderRadius.circular(50)),
                      //           child: Material(
                      //             borderRadius: BorderRadius.circular(50),
                      //             child: InkWell(
                      //               onTap: () {
                      //                 Map payload = {
                      //                   'napza': detail[index],
                      //                   'efek': efek[index],
                      //                   'name': nama[index],
                      //                   'picture': images[index]
                      //                 };
                      //                 Navigator.of(context).pushNamed(
                      //                     Routes.detailJenisNapza,
                      //                     arguments: payload);
                      //               },
                      //               child: Stack(
                      //                 children: <Widget>[
                      //                   Container(
                      //                     decoration: BoxDecoration(
                      //                       borderRadius:
                      //                           BorderRadius.circular(50),
                      //                       image: DecorationImage(
                      //                         fit: BoxFit.cover,
                      //                         image: AssetImage(images[index]),
                      //                       ),
                      //                     ),
                      //                     // child: Image.asset(
                      //                     //   images[index],
                      //                     //   width: size.width,
                      //                     //   // height: 50,
                      //                     //   fit: BoxFit.none,
                      //                     // ),
                      //                     child: Container(
                      //                       decoration: BoxDecoration(
                      //                         borderRadius:
                      //                             BorderRadius.circular(50),
                      //                         gradient: LinearGradient(
                      //                             begin: Alignment.topRight,
                      //                             end: Alignment.bottomLeft,
                      //                             colors: [
                      //                               Colors.transparent,
                      //                               Colors.black
                      //                             ]),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   Container(
                      //                     alignment: Alignment.centerLeft,
                      //                     child: Container(
                      //                       // decoration: BoxDecoration(
                      //                       //     gradient: LinearGradient(
                      //                       //         begin: Alignment.topRight,
                      //                       //         end: Alignment.bottomLeft,
                      //                       //         colors: [
                      //                       //       Colors.transparent,
                      //                       //       Colors.black
                      //                       //     ])),
                      //                       margin: EdgeInsets.only(
                      //                           left: size.width * 0.1),
                      //                       alignment: Alignment.centerLeft,
                      //                       height: 52,
                      //                       width: size.width * 0.7,
                      //                       // decoration: BoxDecoration(
                      //                       //     color: Colors.red, shape: BoxShape.circle),
                      //                       child: Text(
                      //                         nama[index],
                      //                         style: Theme.of(context)
                      //                             .textTheme
                      //                             .headline5
                      //                             .copyWith(
                      //                                 fontFamily:
                      //                                     'Poppins-SemiBold',
                      //                                 fontWeight: FontWeight.w900,
                      //                                 color: Colors.white),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   Align(
                      //                     alignment: Alignment.centerRight,
                      //                     child: Container(
                      //                       margin: EdgeInsets.only(
                      //                           right: size.width * 0.03),
                      //                       alignment: Alignment.center,
                      //                       height: 52,
                      //                       width: 52,
                      //                       decoration: BoxDecoration(
                      //                           color: Colors.white,
                      //                           shape: BoxShape.circle),
                      //                       child: Icon(const IconData(58849,
                      //                           fontFamily: 'MaterialIcons',
                      //                           matchTextDirection: true)),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //       }),
                      // ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}

