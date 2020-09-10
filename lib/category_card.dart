import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final String pictureSrc;
  final Function press;
  const CategoryCard({
    Key key,
    this.pictureSrc,
    this.svgSrc,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(45),
        boxShadow: [
          BoxShadow(
            offset: Offset(0,10),
            blurRadius: 12,
            // spreadRadius: 12,
            color: Colors.grey[400]
          )
        ]
      ),
      child: Material(
        borderRadius: BorderRadius.circular(45),
        child: InkWell(
          onTap: press,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              svgSrc != null ? 
                SvgPicture.asset(svgSrc) : 
                Image.asset(pictureSrc,
                  height: 50,
                  fit: BoxFit.fill,),
              SizedBox(height: 10,),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(20),
    //   child: Container(
    //     // padding: EdgeInsets.all(20),
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(13),
    //       boxShadow: [
    //         BoxShadow(
    //           offset: Offset(0, 17),
    //           blurRadius: 17,
    //           spreadRadius: -23,
    //           color: Color(0xFFE6E6E6),
    //         ),
    //       ],
    //     ),
    //     child: Material(
    //       color: Colors.transparent,
    //       child: InkWell(
    //         onTap: press,
    //         child: Padding(
    //           padding: const EdgeInsets.all(20.0),
    //           child: Column(
    //             children: <Widget>[
    //               Spacer(),
    //                 svgSrc != null ? 
    //                   SvgPicture.asset(svgSrc) : 
    //                   Image.asset(pictureSrc,
    //                     height: 120,
    //                     fit: BoxFit.fill,),
    //               Spacer(),
    //               Text(
    //                 title,
    //                 textAlign: TextAlign.center,
    //                 style: Theme.of(context)
    //                     .textTheme
    //                     .title
    //                     .copyWith(fontSize: 15),
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
