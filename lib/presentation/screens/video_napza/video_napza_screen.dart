import 'package:flutter/material.dart';
import 'package:info_napza/model/jenis_napza_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoNapzaScreen extends StatefulWidget {  
  @override
  State<StatefulWidget> createState() => _VideoNapzaScreenState();
}

class _VideoNapzaScreenState extends State<VideoNapzaScreen> {
  List<String> images = ['assets/images/ganja.jpeg', 'assets/images/kokain.jpg', 'assets/images/ekstasi.png', 'assets/images/morphine-pills.jpg', 'assets/images/morphine-pills.jpg'];
  List<String> name = ['Sabu', 'Cocain', 'Ekstasy', 'Morfin', 'Obat Penenang'];
  List<String> detailName = [shabu, cocain, ekstasy, morfin, obatPenenang];
  List<dynamic> efekNapza = [
    efekShabu,
    efekCocain,
    efekEkstasy,
    efekMorfin,
    efekObatPenenang
  ];
  
  @override
  void initState(){
    super.initState();
    
  }
  
  final List<YoutubePlayerController> _controllers = [
    YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=fMisx2isrcc"),
    // YoutubePlayer.convertUrlToId("https://youtu.be/XdiH34GWqcs"),
    // YoutubePlayer.convertUrlToId("https://youtu.be/x6LqoADhJZg"),
    // YoutubePlayer.convertUrlToId("https://youtu.be/1Hcd_F9KJtk"),
    // YoutubePlayer.convertUrlToId("https://youtu.be/3ZY0hJmfndA"),
    // YoutubePlayer.convertUrlToId("https://youtu.be/GZYnpHpWs-U"),
    // YoutubePlayer.convertUrlToId("https://youtu.be/WXn_-kpMA2M"),
    // YoutubePlayer.convertUrlToId("https://youtu.be/ChO-cJHxSUc"),
    // YoutubePlayer.convertUrlToId("https://youtu.be/G7hAmsVOFOA"),
    // YoutubePlayer.convertUrlToId("https://youtu.be/xD7o7-_rr8g"),
    // YoutubePlayer.convertUrlToId("https://youtu.be/x6LqoADhJZg"),
  // "fMisx2isrcc",
  //   "XdiH34GWqcs",
  //   "x6LqoADhJZg",
  //   "1Hcd_F9KJtk",
  //   "3ZY0hJmfndA",
  //   "GZYnpHpWs-U",
  //   "WXn_-kpMA2M",
  //   "ChO-cJHxSUc",
  //   "G7hAmsVOFOA",
  //   "xD7o7-_rr8g",
  //   "x6LqoADhJZg",
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            
          ),
        ),
      )
      .toList();

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
                // child: SvgPicture.asset('assets/icons/menu.svg'),
                child: Icon(const IconData(58848,
                    fontFamily: 'MaterialIcons', matchTextDirection: true)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.65,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child:  ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(size.width * .05),
            child: YoutubePlayer(
              key: ObjectKey(_controllers[index]),
              controller: _controllers[index],
              actionsPadding: const EdgeInsets.only(left: 16.0),
              bottomActions: [
                CurrentPosition(),
                const SizedBox(width: 10.0),
                ProgressBar(isExpanded: true),
                const SizedBox(width: 10.0),
                RemainingDuration(),
                
                // FullScreenButton(

                // ),
              ],
            ),
          );
        },
        itemCount: _controllers.length,
        separatorBuilder: (context, _) => const SizedBox(height: 10.0),
      ),
            ),
          )
        ],
      ),
    );
  }
}
