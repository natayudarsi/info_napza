// import 'package:flutter/material.dart';

// class BookCard extends StatelessWidget {
//   final String svgSrc;
//   final String title;
//   final String pictureSrc;
//   final Function press;
//   const BookCard({
//     Key key,
//     this.pictureSrc,
//     this.svgSrc,
//     this.title,
//     this.press,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Container(
//       height: size.height * 0.27,
//       width: size.width * 0.27,
//       margin: EdgeInsets.all(10),
//       padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0,10),
//             blurRadius: 12,
//             // spreadRadius: 12,
//             color: Colors.grey[400]
//           )
//         ]
//       ),
//       child: Material(
//         borderRadius: BorderRadius.circular(20),
//         child: InkWell(
//           onTap: press,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Container(
//                 width: size.width * 0.2,
//                 height: size.height * 0.17,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20)
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.asset(pictureSrc,
//                   width: size.width * 0.2,
//                   fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               // svgSrc != null ? 
//               //   SvgPicture.asset(svgSrc) : 
//               //   Image.asset(pictureSrc,
//               //     height: 50,
//               //     fit: BoxFit.fill,),
//               // SizedBox(height: size.height * 0.05,),
//               Expanded(
//                               child: Text(
//                   title,
//                   textAlign: TextAlign.center,
//                   style: Theme.of(context)
//                     .textTheme
//                     .title
//                     .copyWith(fontSize: 15),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
