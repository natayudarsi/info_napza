import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_napza/model/info_napza.dart';
import 'package:info_napza/model/jenis_napza_model.dart';
import 'package:link_text/link_text.dart';


class InfoNapzaScreen extends StatelessWidget {
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
              'assets/images/Artwork-4.jpg',
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
                child: Icon(const IconData(58848,
                    fontFamily: 'MaterialIcons', matchTextDirection: true)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width * 0.07),
              height: size.height * 0.65,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Info Napza',
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Poppins-SemiBold',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Container(
                      width: size.width,
                      height: size.height * 0.3,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: InfoNapza.berita.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(size.width * .02),
                              height: 100,
                              width: size.width * 0.7,
                              margin: EdgeInsets.all(5),
                              // color: Colors.red,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: LinkText(
                                textAlign: TextAlign.justify,
                                text: InfoNapza.berita[index],
                              )
                            );
                          }),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Text(
                      'Langkah Cara Mengatasi Kecanduan Narkoba',
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Poppins-SemiBold',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    RichText(
                      text: TextSpan(
                          text: KecanduanNapza.pengertian,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: 'Roboto'),
                          children: <TextSpan>[
                            TextSpan(
                                text: '\nPemeriksaan\n',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins-SemiBold',
                                )),
                            TextSpan(
                              text: KecanduanNapza.pemeriksaan,
                            ),
                            TextSpan(
                                text: '\nDetoksifikasi\n',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins-SemiBold',
                                )),
                            TextSpan(text: KecanduanNapza.detoksifikasi),
                            TextSpan(
                                text: '\nStabilisasi\n',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins-SemiBold',
                                )),
                            TextSpan(text: KecanduanNapza.stabilisasi),
                            TextSpan(
                                text: '\nPengelolaan Aktivitas\n',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins-SemiBold',
                                )),
                            TextSpan(text: KecanduanNapza.pengelolaanAktivitas),
                            TextSpan(
                                text:
                                    '\nAtasi dengan Layanan Rahabilitasi BNN\n',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins-SemiBold',
                                )),
                            TextSpan(text: KecanduanNapza.rehabilitasiBnn),
                            TextSpan(
                                text: '\nRehabilitasi Medis\n',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins-SemiBold',
                                )),
                            TextSpan(text: KecanduanNapza.rehabilitasiMedis),
                            TextSpan(
                                text: '\nRehabilitasi Sosial\n',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins-SemiBold',
                                )),
                            TextSpan(text: KecanduanNapza.rehabilitasiSosial),
                            TextSpan(
                                text: '\nKegiatan Kerohanian\n',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins-SemiBold',
                                )),
                            TextSpan(text: KecanduanNapza.kegiatanRohani),
                            TextSpan(
                                text: '\nPeningkatan Kemampuan\n',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins-SemiBold',
                                )),
                            TextSpan(text: KecanduanNapza.peningkatanKemampuan)
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
