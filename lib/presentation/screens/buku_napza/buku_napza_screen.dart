// import 'package:flutter/material.dart';
// import 'package:info_napza/presentation/widget/book_card.dart';
// import 'package:info_napza/presentation/widget/pdf_viewer.dart';
// import 'package:native_pdf_view/native_pdf_view.dart';

// class BukuNapzaScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _BukuNapzaScreenState();
// }

// class _BukuNapzaScreenState extends State<BukuNapzaScreen> {
//   PDFDocument document;

//   Future<void> _getDocument(String idDocument) async {
//     document = await PDFDocument.openAsset('assets/pdf/$idDocument.pdf');
//   }

//   @override
//   void initState() {
//     super.initState();
//     // _getDocument('1');
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: size.height * .5,
//             color: Colors.pink[100],
//             child: Image.asset(
//               'assets/images/Artwork-3.jpg',
//               width: size.width,
//               fit: BoxFit.fill,
//             ),
//           ),
//           Align(
//           alignment: Alignment.topLeft,
//           child: GestureDetector(
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//             child: Container(
//               margin: EdgeInsets.only(
//                   top: size.height * 0.05, left: size.width * 0.05),
//               alignment: Alignment.center,
//               height: 52,
//               width: 52,
//               decoration:
//                   BoxDecoration(color: Colors.white, shape: BoxShape.circle),
//               // child: SvgPicture.asset('assets/icons/menu.svg'),
//               child: Icon(const
//                 IconData(58848, fontFamily: 'MaterialIcons', matchTextDirection: true)
//               ),
//             ),
//           ),
//         ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//                 padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
//                 height: size.height * .65,
//                 decoration: BoxDecoration(
//                     color: Colors.grey[100],
//                     borderRadius:
//                         BorderRadius.vertical(top: Radius.circular(40))),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           BookCard(
//                             title: "Raih Prestasi Tanpa Narkoba",
//                             // svgSrc: "assets/icons/Hamburger.svg",
//                             pictureSrc: "assets/images/buku1.png",
//                             press: () async {
//                               document =
//                                   await PDFDocument.openAsset('assets/pdf/1.pdf');

//                               Navigator.push(context,
//                                   MaterialPageRoute(builder: (context) {
//                                 return BookViewScreen(document: document,title: "Raih Prestasi Tanpa Narkoba",);
//                               }));
//                             },
//                           ),
//                           BookCard(
//                             title: "Awas! Narkoba Masuk Desa",
//                             // svgSrc: "assets/icons/Hamburger.svg",
//                             pictureSrc: "assets/images/buku2.png",
//                             press: () async {
//                               document =
//                                   await PDFDocument.openAsset('assets/pdf/2.pdf');

//                               Navigator.push(context,
//                                   MaterialPageRoute(builder: (context) {
//                                 return BookViewScreen(document: document, title: "Awas! Narkoba Masuk Desa");
//                               }));
//                             },
//                           ),
//                           BookCard(
//                             title: "Keluarga Sehat Tanpa Narkoba",
//                             // svgSrc: "assets/icons/Hamburger.svg",
//                             pictureSrc: "assets/images/buku3.png",
//                             press: () async {
//                               document =
//                                   await PDFDocument.openAsset('assets/pdf/3.pdf');

//                               Navigator.push(context,
//                                   MaterialPageRoute(builder: (context) {
//                                 return BookViewScreen(document: document, title: "Keluarga Sehat Tanpa Narkoba",);
//                               }));
//                             },
//                           ),
//                         ],
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           BookCard(
//                             title: "Buletin Napza",
//                             // svgSrc: "assets/icons/Hamburger.svg",
//                             pictureSrc: "assets/images/buku4.png",
//                             press: () async {
//                               document =
//                                   await PDFDocument.openAsset('assets/pdf/4.pdf');

//                               Navigator.push(context,
//                                   MaterialPageRoute(builder: (context) {
//                                 return BookViewScreen(document: document,title: "Buletin Napza",);
//                               }));
//                             },
//                           ),
                         
//                         ],
//                       ),
//                     ],
//                   ),
//                 )
//                 ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class SeassionCard extends StatelessWidget {
//   final int seassionNum;
//   final bool isDone;
//   final Function press;
//   const SeassionCard({
//     Key key,
//     this.seassionNum,
//     this.isDone = false,
//     this.press,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraint) {
//       return ClipRRect(
//         borderRadius: BorderRadius.circular(13),
//         child: Container(
//           width: constraint.maxWidth / 2 -
//               10, // constraint.maxWidth provide us the available with for this widget
//           // padding: EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(13),
//             boxShadow: [
//               BoxShadow(
//                 offset: Offset(0, 17),
//                 blurRadius: 23,
//                 spreadRadius: -13,
//                 color: Color(0xFFE6E6E6),
//               ),
//             ],
//           ),
//           child: Material(
//             color: Colors.transparent,
//             child: InkWell(
//               onTap: press,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   children: <Widget>[
//                     Container(
//                       height: 42,
//                       width: 43,
//                       decoration: BoxDecoration(
//                         color: isDone ? Color(0xFF817DC0) : Colors.white,
//                         shape: BoxShape.circle,
//                         border: Border.all(color: Color(0xFF817DC0)),
//                       ),
//                       child: Icon(
//                         Icons.play_arrow,
//                         color: isDone ? Colors.white : Color(0xFF817DC0),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Text(
//                       "Session $seassionNum",
//                       style: Theme.of(context).textTheme.subtitle,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
