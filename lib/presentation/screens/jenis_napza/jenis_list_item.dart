import 'package:flutter/material.dart';
import 'package:info_napza/common/routing/routes.dart';

class JenisListItem extends StatelessWidget {
  JenisListItem(this.detail, this.efek, this.nama, this.images);
  final String detail;

  final dynamic efek;
  final String nama;
  final String images;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      height: size.height * .1,
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(50)),
      child: Material(
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          onTap: () {
            Map payload = {
              'napza': detail,
              'efek': efek,
              'name': nama,
              'picture': images
            };
            Navigator.of(context)
                .pushNamed(Routes.detailJenisNapza, arguments: payload);
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
                // child: Image.asset(
                //   images[index],
                //   width: size.width,
                //   // height: 50,
                //   fit: BoxFit.none,
                // ),
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
                  // decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //         begin: Alignment.topRight,
                  //         end: Alignment.bottomLeft,
                  //         colors: [
                  //       Colors.transparent,
                  //       Colors.black
                  //     ])),
                  margin: EdgeInsets.only(left: size.width * 0.1),
                  alignment: Alignment.centerLeft,
                  height: 52,
                  width: size.width * 0.7,
                  // decoration: BoxDecoration(
                  //     color: Colors.red, shape: BoxShape.circle),
                  child: Text(
                    nama,
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
