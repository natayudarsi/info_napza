import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:info_napza/category_card.dart';
import 'package:info_napza/common/routing/routes.dart';
import 'package:info_napza/model/jenis_napza_model.dart';

class JenisNapzaScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _JenisNapzaScreenState();
}

class _JenisNapzaScreenState extends State<JenisNapzaScreen>{
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.pink[100],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.01,bottom: size.height * 0.05),
                    alignment: Alignment.center,
                      child: Text(
                      'Jenis-jenis Napza',
                      style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(fontWeight: FontWeight.w900),
                    ),
                  ),
                  // SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Cocain",
                          pictureSrc: "assets/images/cocain.jpeg",
                          press: () {
                            Map payload = {
                              'napza': cocain,
                              'efek': efekCocain,
                            };
                            Navigator.of(context).pushNamed(Routes.detailJenisNapza, arguments: payload);
                          },
                        ),
                        CategoryCard(
                          title: "Ectasy",
                          pictureSrc: "assets/images/ectasy.jpeg",
                          press: () {
                          },
                        ),
                        CategoryCard(
                          title: "Ganja",
                          pictureSrc: "assets/images/ganja.jpeg",
                          press: () {
                          },
                        ),
                        CategoryCard(
                          title: "Morphine",
                          pictureSrc: "assets/images/morphine.jpeg",
                          press: () {
                          },
                        ),
                        CategoryCard(
                          title: "Obat Penenang",
                          pictureSrc: "assets/images/obat-penenang.jpeg",
                          press: () {
                          },
                        ),
                      ],
                    )
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }

}