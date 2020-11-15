import 'package:flutter/material.dart';

class DetailJenisNapzaScreen extends StatelessWidget {
  final String name;
  final String napza;
  final List efek;
  final String picture;

  const DetailJenisNapzaScreen({Key key, this.napza, this.efek, this.name, this.picture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var efekList = <Widget>[];
    for (var text in efek) {
      efekList.add(UnorderedListItem(text));
      efekList.add(SizedBox(
        height: 5.0,
      ));
    }

    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
            height: size.height * .45,
            child: Image.asset(
              picture,
              width: size.width,
              fit: BoxFit.fill,
            ),
          ),
        Container(
          padding: EdgeInsets.only(bottom: size.height * 0.13),
          height: size.height * .45,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'Poppins-SemiBold'),
            ),
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
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.02, horizontal: size.width * 0.07),
            height: size.height * 0.65,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: 'Apa itu ',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              // fontWeight: FontWeight.w600,
                              color: Colors.black
                            ),
                        children: <TextSpan>[
                          TextSpan(
                              text: name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black)),
                          TextSpan(text: ' ?')
                        ]),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    napza,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Efek ',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              // fontWeight: FontWeight.w600,
                              color: Colors.black
                            ),
                        children: <TextSpan>[
                          TextSpan(
                              text: name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(
                                    fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black)),
                        ]),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Column(
                    children: efekList,
                  ),
                ],
              ),
            ),
          ),
        ),
        
      ],
    ));
  }
}

class UnorderedListItem extends StatelessWidget {
  UnorderedListItem(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "  • ",
          style: TextStyle(fontSize: 20),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16,fontFamily: 'Roboto'),
          ),
        ),
      ],
    );
  }
}
