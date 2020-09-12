import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:info_napza/category_card.dart';
import 'package:info_napza/common/routing/routes.dart';
import 'package:info_napza/model/jenis_napza_model.dart';

class JenisNapzaScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _JenisNapzaScreenState();
}

class _JenisNapzaScreenState extends State<JenisNapzaScreen> {
  List<String> images = ['assets/images/ganja.jpeg', 'assets/images/kokain.jpg', 'assets/images/ekstasi.png', 'assets/images/morphine-pills.jpg', 'assets/images/morphine-pills.jpg'];
  List<String> name = ['Sabu', 'Cocain', 'Ekstasy', 'Morfin', 'Obat Penenang'];
  List<String> detailName = [shabu, cocain, ekstasy, morfin, obatPenenang];
  List<dynamic> efekNapza = [
    efekShabu,
    efekCocain,
    efekEkstasy,
    efekMorfin,
    efekObatPenenang
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
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
                child: Icon(IconData(58848,
                    fontFamily: 'MaterialIcons', matchTextDirection: true)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.65,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1,
                        vertical: size.height * 0.01),
                    height: size.height * .1,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50)),
                    child: Material(
                      borderRadius: BorderRadius.circular(50),
                      child: InkWell(
                        onTap: () {
                          Map payload = {
                            'napza': detailName[index],
                            'efek': efekNapza[index],
                            'name': name[index],
                            'picture': images[index]
                          };
                          Navigator.of(context).pushNamed(
                              Routes.detailJenisNapza,
                              arguments: payload);
                        },
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                images[index],
                                width: size.width,
                                // height: 50,
                                fit: BoxFit.none,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin:
                                    EdgeInsets.only(left: size.width * 0.03),
                                alignment: Alignment.centerLeft,
                                height: 52,
                                width: size.width * 0.7,
                                // decoration: BoxDecoration(
                                //     color: Colors.red, shape: BoxShape.circle),
                                child: Text(
                                  name[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin:
                                    EdgeInsets.only(right: size.width * 0.03),
                                alignment: Alignment.center,
                                height: 52,
                                width: 52,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Icon(IconData(58849,
                                    fontFamily: 'MaterialIcons',
                                    matchTextDirection: true)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
          // SafeArea(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: <Widget>[
          //         Container(
          //           margin: EdgeInsets.only(top: size.height * 0.01,bottom: size.height * 0.05),
          //           alignment: Alignment.center,
          //             child: Text(
          //             'Jenis-jenis Napza',
          //             style: Theme.of(context)
          //                   .textTheme
          //                   .display1
          //                   .copyWith(fontWeight: FontWeight.w900),
          //           ),
          //         ),
          //         // SearchBar(),
          //         Expanded(
          //           child: GridView.count(
          //             crossAxisCount: 2,
          //             childAspectRatio: .85,
          //             crossAxisSpacing: 20,
          //             mainAxisSpacing: 20,
          //             children: <Widget>[
          //               CategoryCard(
          //                 title: "Cocain",
          //                 pictureSrc: "assets/images/cocain.jpeg",
          //                 press: () {
          //                   Map payload = {
          //                     'napza': cocain,
          //                     'efek': efekCocain,
          //                   };
          //                   Navigator.of(context).pushNamed(Routes.detailJenisNapza, arguments: payload);
          //                 },
          //               ),
          //               CategoryCard(
          //                 title: "Ectasy",
          //                 pictureSrc: "assets/images/ectasy.jpeg",
          //                 press: () {
          //                 },
          //               ),
          //               CategoryCard(
          //                 title: "Ganja",
          //                 pictureSrc: "assets/images/ganja.jpeg",
          //                 press: () {
          //                 },
          //               ),
          //               CategoryCard(
          //                 title: "Morphine",
          //                 pictureSrc: "assets/images/morphine.jpeg",
          //                 press: () {
          //                 },
          //               ),
          //               CategoryCard(
          //                 title: "Obat Penenang",
          //                 pictureSrc: "assets/images/obat-penenang.jpeg",
          //                 press: () {
          //                 },
          //               ),
          //             ],
          //           )
          //         )
          //       ],
          //     ),
          //   )
          // )
        ],
      ),
    );
  }
}
