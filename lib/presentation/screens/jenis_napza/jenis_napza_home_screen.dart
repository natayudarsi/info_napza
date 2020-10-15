import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:info_napza/category_card.dart';
import 'package:info_napza/common/routing/routes.dart';
import 'package:info_napza/model/jenis_napza_model.dart';

class JenisNapzaHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _JenisNapzaHomeScreenState();
}

class _JenisNapzaHomeScreenState extends State<JenisNapzaHomeScreen> {
  // List<String> images = [
  //   'assets/images/ganja.jpeg',
  //   'assets/images/kokain.jpg',
  //   'assets/images/ekstasi.png',
  //   'assets/images/morphine-pills.jpg',
  //   'assets/images/morphine-pills.jpg'
  // ];
  // List<String> name = ['Sabu', 'Cocain', 'Ekstasy', 'Morfin', 'Obat Penenang'];
  // List<String> detailName = [shabu, cocain, ekstasy, morfin, obatPenenang];
  // List<dynamic> efekNapza = [
  //   efekShabu,
  //   efekCocain,
  //   efekEkstasy,
  //   efekMorfin,
  //   efekObatPenenang
  // ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      napzaAdalah,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    WidgetNapza(
                      images: 'assets/images/ganja.jpeg',
                      jenis: 'Narkotika',
                    ),
                    WidgetNapza(
                      images: 'assets/images/ekstasi.png',
                      jenis: 'Psikotropika',
                    ),
                    WidgetNapza(
                      images: 'assets/images/wiski.jpg',
                      jenis: 'Zat Adiktif',
                    )
                  ],
                ))),
          )
        ],
      ),
    );
  }
}

class WidgetNapza extends StatelessWidget {
  final String jenis;
  final String images;

  const WidgetNapza({Key key, this.jenis, this.images}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      height: size.height * .1,
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(50)),
      child: Material(
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(Routes.jenisNapza, arguments: jenis);
          },
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(images),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.transparent, Colors.black]),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: size.width * 0.1),
                  alignment: Alignment.centerLeft,
                  height: 52,
                  width: size.width * 0.7,
                  child: Text(
                    jenis,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        fontFamily: 'Poppins-SemiBold',
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(right: size.width * 0.03),
                  alignment: Alignment.center,
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Icon(const IconData(58849,
                      fontFamily: 'MaterialIcons', matchTextDirection: true)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
