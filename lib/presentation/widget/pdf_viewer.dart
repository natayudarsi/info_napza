
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class BookViewScreen extends StatefulWidget {
  final PDFDocument document;
  final String title;

  BookViewScreen({this.document, this.title});

  @override
  State<StatefulWidget> createState() => _BookViewScreenState();
}

class _BookViewScreenState extends State<BookViewScreen> {
  int _actualPageNumber = 1;
  // PDFController _pdfController;
  PDFDocument document;
  int jumlahHalaman;

  // Future<void> _getDocument() async{
  //   document = await PDFDocument.openAsset('assets/example.pdf');
  // }

  @override
  void initState() {
    super.initState();
    // _getDocument();
    document = widget.document;
    jumlahHalaman = document.pagesCount;
  }

  @override
  void dispose() {
    // _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.white),
        home: Scaffold(
          
          appBar: AppBar(
            // backgroundColor: Colors.black,
            title: Expanded(child: Text(widget.title)),
            actions: <Widget>[
              // IconButton(
              //   icon: Icon(Icons.navigate_before),
              //   onPressed: () {
              //     // _pdfController.previousPage(
              //     //   curve: Curves.ease,
              //     //   duration: Duration(milliseconds: 100),
              //     // );
              //   },
              // ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: Text(
                  '$_actualPageNumber/$jumlahHalaman',
                  style: TextStyle(fontSize: 22, ),
                ),
              ),
              // IconButton(
              //   icon: Icon(Icons.navigate_next),
              //   onPressed: () {
              //     // _pdfController.nextPage(
              //     //   curve: Curves.ease,
              //     //   duration: Duration(milliseconds: 100),
              //     // );
              //   },
              // ),
            ],
          ),
          body:Container(
            child: FutureBuilder<PDFDocument>(
              future: Future.value(document),
              builder: (context, snapshot) {
                print(snapshot);
                if(snapshot.hasError) {
                  print('masuk has eror');
                  return Center(
                    child: Text('load error') 
                  );
                }
                if(snapshot.hasData) {
                  
                  print('masuk has data');
                  return Container(
                    child : 
                    PDFView(
                      document: document,
                      // documentLoader: Center(child: CircularProgressIndicator()),
                      // pageLoader: Center(child: CircularProgressIndicator()),
                      // controller: _pdfController,
                      // onDocumentLoaded: (document) {
                      //   setState(() {
                      //     _allPagesCount = document.pagesCount;
                      //   });
                      // },
                      // scrollDirection: Axis.vertical,
                      
                      onPageChanged: (page) {
                        setState(() {
                          _actualPageNumber = page;
                        });
                      },
                    )
                  );
                }
                return Container();
              }
              
            )
          //   child : 
          // PDFView(
          //   document: document,
          //   // documentLoader: Center(child: CircularProgressIndicator()),
          //   // pageLoader: Center(child: CircularProgressIndicator()),
          //   // controller: _pdfController,
          //   // onDocumentLoaded: (document) {
          //   //   setState(() {
          //   //     _allPagesCount = document.pagesCount;
          //   //   });
          //   // },
          //   // scrollDirection: Axis.vertical,
          //   onPageChanged: (page) {
          //     setState(() {
          //       _actualPageNumber = page;
          //     });
          //   },
          // )
          ),
        ),
      );

}