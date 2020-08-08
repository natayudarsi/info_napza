import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:info_napza/common/config/screen_config.dart';
import 'package:info_napza/presentation/widget/pdf_viewer.dart';
// import 'package:info_napza/bottom_navbar.dart';
import 'package:info_napza/search_bar.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class BukuNapzaScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BukuNapzaScreenState();

}

class _BukuNapzaScreenState extends State<BukuNapzaScreen> {
  PDFDocument document;

  Future<void> _getDocument(String idDocument) async{
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
            height: size.height ,
            decoration: BoxDecoration(
              color: Color(0xFFC7B8F5),
              image: DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Buku Napza",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    // SizedBox(height: 10),
                    // Text(
                    //   "3-10 MIN Course",
                    //   style: TextStyle(fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(height: 10),
                    // SizedBox(
                    //   width: size.width * .6, // it just take 60% of total width
                    //   child: Text(
                    //     "Live happier and healthier by learning the fundamentals of meditation and mindfulness",
                    //   ),
                    // ),
                    // SizedBox(height: 20),
                    // Text(
                    //   "Meditation",
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .title
                    //       .copyWith(fontWeight: FontWeight.bold),
                    // ),
                    
                    
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.15),
            // color: Colors.red,
            child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index){
                        return Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: size.width * 0.05
                            
                            ),
                          // padding: EdgeInsets.all(10),
                          height: 90,
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
                          child: RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            onPressed: ()async {

                              document = await PDFDocument.openAsset('assets/pdf/${index+1}.pdf');

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return BookViewScreen(document: document);
                                })
                              );
                            },
                                                      child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  "assets/icons/Meditation_women_small.svg",
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Basic ${index+1}",
                                        style: Theme.of(context).textTheme.subtitle,
                                      ),
                                      Text("Start your deepen you practice")
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: SvgPicture.asset("assets/icons/Lock.svg"),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    ),
          )
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
