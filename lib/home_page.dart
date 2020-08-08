import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:info_napza/category_card.dart';
import 'package:info_napza/common/routing/routes.dart';
import 'package:info_napza/details_screen.dart';
import 'package:info_napza/search_bar.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class MyHomePageScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyHomePageScreenState();
}

class _MyHomePageScreenState extends State<MyHomePageScreen> {
  PDFDocument document;


  Future<void> _getDocument() async{
    document = await PDFDocument.openAsset('assets/example.pdf');
  }

  @override
  void initState() {
    super.initState();
    _getDocument();
    print('homepage');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
      .size;  //this gonna give us total height and with of our device
    return Scaffold(
      // bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEBB),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage('assets/images/undraw_pilates_gpdb.png'),
              )
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle
                      ),
                      child: SvgPicture.asset('assets/icons/menu.svg'),
                    ),
                  ),
                  Text(
                    'Aplikasi \nInformasi Napza',
                    style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Jenis Napza",
                          svgSrc: "assets/icons/Hamburger.svg",
                          press: () {
                            // Navigator.of(context).pushNamed(Routes.kuisScreen);
                          },
                        ),
                        CategoryCard(
                          title: "Buku-buku Napza",
                          svgSrc: "assets/icons/Excrecises.svg",
                          press: () {
                            Navigator.of(context).pushNamed(Routes.bukuNapzaScreen);
                          },
                        ),
                        CategoryCard(
                          title: "Video Napza",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) {
                            //     return BookViewScreen(document: document);
                            //   }),
                            // );
                          },
                        ),
                        CategoryCard(
                          title: "Kuis",
                          svgSrc: "assets/icons/yoga.svg",
                          press: () {
                            Navigator.of(context).pushNamed(Routes.kuisScreen);
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