import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:info_napza/category_card.dart';
import 'package:info_napza/common/config/screen_config.dart';
import 'package:info_napza/common/routing/routes.dart';
import 'package:info_napza/presentation/widget/book_card.dart';
import 'package:info_napza/presentation/widget/pdf_viewer.dart';
// import 'package:info_napza/bottom_navbar.dart';
import 'package:info_napza/search_bar.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class BukuNapzaScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BukuNapzaScreenState();
}

class _BukuNapzaScreenState extends State<BukuNapzaScreen> {
  PDFDocument document;

  Future<void> _getDocument(String idDocument) async {
    document = await PDFDocument.openAsset('assets/pdf/$idDocument.pdf');
  }

  @override
  void initState() {
    super.initState();
    // _getDocument('1');
  }

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
              'assets/images/Artwork-3.jpg',
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
              child: Icon(const
                IconData(58848, fontFamily: 'MaterialIcons', matchTextDirection: true)
              ),
            ),
          ),
        ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
                height: size.height * .65,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    BookCard(
                      title: "Raih Prestasi Tanpa Narkoba",
                      // svgSrc: "assets/icons/Hamburger.svg",
                      pictureSrc: "assets/images/buku1.png",
                      press: () async {
                        document =
                            await PDFDocument.openAsset('assets/pdf/1.pdf');

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BookViewScreen(document: document,title: "Raih Prestasi Tanpa Narkoba",);
                        }));
                      },
                    ),
                    BookCard(
                      title: "Awas! Narkoba Masuk Desa",
                      // svgSrc: "assets/icons/Hamburger.svg",
                      pictureSrc: "assets/images/buku2.png",
                      press: () async {
                        document =
                            await PDFDocument.openAsset('assets/pdf/2.pdf');

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BookViewScreen(document: document, title: "Awas! Narkoba Masuk Desa");
                        }));
                      },
                    ),
                    BookCard(
                      title: "Keluarga Sehat Tanpa Narkoba",
                      // svgSrc: "assets/icons/Hamburger.svg",
                      pictureSrc: "assets/images/buku3.png",
                      press: () async {
                        document =
                            await PDFDocument.openAsset('assets/pdf/3.pdf');

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BookViewScreen(document: document, title: "Keluarga Sehat Tanpa Narkoba",);
                        }));
                      },
                    ),
                  ],
                )
                // child : GridView.count(
                //   crossAxisCount: 3,
                //   // childAspectRatio: .85,
                //   // crossAxisSpacing: 5,
                //   // mainAxisSpacing: 5,
                //   children: <Widget>[
                //     BookCard(
                //       title: "Jenis Napza",
                //       svgSrc: "assets/icons/Hamburger.svg",
                //       press: () {
                //         Navigator.of(context).pushNamed(Routes.jenisNapzaScreen);
                //       },
                //     ),
                //     BookCard(
                //       title: "Buku-buku Napza",
                //       svgSrc: "assets/icons/Excrecises.svg",
                //       press: () {
                //         Navigator.of(context).pushNamed(Routes.bukuNapzaScreen);
                //       },
                //     ),
                //     BookCard(
                //       title: "Video Napza",
                //       svgSrc: "assets/icons/Meditation.svg",
                //       press: () {

                //       },
                //     ),

                //   ],
                // )
                ),
          )
          // Container(
          //   margin: EdgeInsets.only(top: size.height * 0.15),
          //   // color: Colors.red,
          //   child: ListView.builder(
          //             itemCount: 3,
          //             itemBuilder: (context, index){
          //               return Container(
          //                 margin: EdgeInsets.symmetric(
          //                   vertical: 10,
          //                   horizontal: size.width * 0.05

          //                   ),
          //                 // padding: EdgeInsets.all(10),
          //                 height: 90,
          //                 decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   borderRadius: BorderRadius.circular(13),
          //                   boxShadow: [
          //                     BoxShadow(
          //                       offset: Offset(0, 17),
          //                       blurRadius: 23,
          //                       spreadRadius: -13,
          //                       color: Color(0xFFE6E6E6),
          //                     ),
          //                   ],
          //                 ),
          //                 child: RaisedButton(
          //                   color: Colors.white,
          //                   shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(18.0),
          //                   ),
          //                   onPressed: ()async {

          //                     document = await PDFDocument.openAsset('assets/pdf/${index+1}.pdf');

          //                     Navigator.push(
          //                       context,
          //                       MaterialPageRoute(builder: (context) {
          //                         return BookViewScreen(document: document);
          //                       })
          //                     );
          //                   },
          //                                             child: Row(
          //                     children: <Widget>[
          //                       SvgPicture.asset(
          //                         "assets/icons/Meditation_women_small.svg",
          //                       ),
          //                       SizedBox(width: 20),
          //                       Expanded(
          //                         child: Column(
          //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                           crossAxisAlignment: CrossAxisAlignment.start,
          //                           children: <Widget>[
          //                             Text(
          //                               "Basic ${index+1}",
          //                               style: Theme.of(context).textTheme.subtitle,
          //                             ),
          //                             Text("Start your deepen you practice")
          //                           ],
          //                         ),
          //                       ),
          //                       Padding(
          //                         padding: EdgeInsets.all(10),
          //                         child: SvgPicture.asset("assets/icons/Lock.svg"),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               );
          //             }
          //           ),
          // )
        ],
      ),
    );
  }
}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;
  const SeassionCard({
    Key key,
    this.seassionNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: Color(0xFFE6E6E6),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? Color(0xFF817DC0) : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xFF817DC0)),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : Color(0xFF817DC0),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Session $seassionNum",
                      style: Theme.of(context).textTheme.subtitle,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
