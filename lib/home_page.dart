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
            child : Image.asset(
              'assets/images/Artwork-1.jpg',
              width: size.width,
              fit: BoxFit.fill,
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * .65,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40))
                ),
                    child: GridView.count(
                      crossAxisCount: 2,
                      // childAspectRatio: .85,
                      // crossAxisSpacing: 5,
                      // mainAxisSpacing: 5,
                      children: <Widget>[
                        CategoryCard(
                          title: "Jenis Napza",
                          // svgSrc: "assets/icons/Hamburger.svg",
                          pictureSrc: 'assets/images/phylogenetics.png',
                          press: () {
                            Navigator.of(context).pushNamed(Routes.jenisNapzaScreen);
                          },
                        ),
                        CategoryCard(
                          title: "Buku Napza",
                          // svgSrc: "assets/icons/Excrecises.svg",
                          pictureSrc: 'assets/images/book.png',
                          press: () {
                            Navigator.of(context).pushNamed(Routes.bukuNapzaScreen);
                          },
                        ),
                        CategoryCard(
                          title: "Video Napza",
                          // svgSrc: "assets/icons/Meditation.svg",
                          pictureSrc: 'assets/images/youtube.png',
                          press: 
                          () {
                            Navigator.of(context).pushNamed(Routes.videoScreen);
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
                          // svgSrc: "assets/icons/yoga.svg",
                          pictureSrc: 'assets/images/examination.png',
                          press: () {
                            Navigator.of(context).pushNamed(Routes.kuisScreenStart);
                          },
                        ),
                      ],
                    )
              ),
            )
          // SafeArea(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: <Widget>[
          //         Align(
          //           alignment: Alignment.topRight,
          //           child: Container(
          //             alignment: Alignment.center,
          //             height: 52,
          //             width: 52,
          //             decoration: BoxDecoration(
          //               color: Color(0xFFF2BEA1),
          //               shape: BoxShape.circle
          //             ),
          //             child: SvgPicture.asset('assets/icons/menu.svg'),
          //           ),
          //         ),
          //         Text(
          //           'Aplikasi \nInformasi Napza',
          //           style: Theme.of(context)
          //                 .textTheme
          //                 .display1
          //                 .copyWith(fontWeight: FontWeight.w900),
          //         ),
          //         SearchBar(),
          //         Expanded(
          //           child: GridView.count(
          //             crossAxisCount: 2,
          //             childAspectRatio: .85,
          //             crossAxisSpacing: 20,
          //             mainAxisSpacing: 20,
          //             children: <Widget>[
          //               CategoryCard(
          //                 title: "Jenis Napza",
          //                 svgSrc: "assets/icons/Hamburger.svg",
          //                 press: () {
          //                   Navigator.of(context).pushNamed(Routes.jenisNapzaScreen);
          //                 },
          //               ),
          //               CategoryCard(
          //                 title: "Buku-buku Napza",
          //                 svgSrc: "assets/icons/Excrecises.svg",
          //                 press: () {
          //                   Navigator.of(context).pushNamed(Routes.bukuNapzaScreen);
          //                 },
          //               ),
          //               CategoryCard(
          //                 title: "Video Napza",
          //                 svgSrc: "assets/icons/Meditation.svg",
          //                 press: () {
          //                   // Navigator.push(
          //                   //   context,
          //                   //   MaterialPageRoute(builder: (context) {
          //                   //     return BookViewScreen(document: document);
          //                   //   }),
          //                   // );
          //                 },
          //               ),
          //               CategoryCard(
          //                 title: "Kuis",
          //                 svgSrc: "assets/icons/yoga.svg",
          //                 press: () {
          //                   Navigator.of(context).pushNamed(Routes.kuisScreen);
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