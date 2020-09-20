import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:info_napza/category_card.dart';
import 'package:info_napza/common/routing/routes.dart';
import 'package:info_napza/model/jenis_napza_model.dart';
import 'package:info_napza/presentation/screens/video_napza/video_list.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoNapzaScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VideoNapzaScreenState();
}

class _VideoNapzaScreenState extends State<VideoNapzaScreen> {
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  YoutubePlayerController _controller;
  TextEditingController _idController;
  TextEditingController _seekToController;

  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              log('Settings Tapped!');
            },
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          _controller
              .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          _showSnackBar('Next Video Started!');
        },
      ),
      builder: (context, player) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Image.asset(
              'assets/ypf.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          title: const Text(
            'Youtube Player Flutter',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.video_library),
              onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => VideoList(),
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            player,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _space,
                  _text('Title', _videoMetaData.title),
                  _space,
                  _text('Channel', _videoMetaData.author),
                  _space,
                  _text('Video Id', _videoMetaData.videoId),
                  _space,
                  Row(
                    children: [
                      _text(
                        'Playback Quality',
                        _controller.value.playbackQuality,
                      ),
                      const Spacer(),
                      _text(
                        'Playback Rate',
                        '${_controller.value.playbackRate}x  ',
                      ),
                    ],
                  ),
                  _space,
                  TextField(
                    enabled: _isPlayerReady,
                    controller: _idController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter youtube \<video id\> or \<link\>',
                      fillColor: Colors.blueAccent.withAlpha(20),
                      filled: true,
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.blueAccent,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => _idController.clear(),
                      ),
                    ),
                  ),
                  _space,
                  Row(
                    children: [
                      _loadCueButton('LOAD'),
                      const SizedBox(width: 10.0),
                      _loadCueButton('CUE'),
                    ],
                  ),
                  _space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.skip_previous),
                        onPressed: _isPlayerReady
                            ? () => _controller.load(_ids[
                                (_ids.indexOf(_controller.metadata.videoId) -
                                        1) %
                                    _ids.length])
                            : null,
                      ),
                      IconButton(
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                        onPressed: _isPlayerReady
                            ? () {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                                setState(() {});
                              }
                            : null,
                      ),
                      IconButton(
                        icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                        onPressed: _isPlayerReady
                            ? () {
                                _muted
                                    ? _controller.unMute()
                                    : _controller.mute();
                                setState(() {
                                  _muted = !_muted;
                                });
                              }
                            : null,
                      ),
                      FullScreenButton(
                        controller: _controller,
                        color: Colors.blueAccent,
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_next),
                        onPressed: _isPlayerReady
                            ? () => _controller.load(_ids[
                                (_ids.indexOf(_controller.metadata.videoId) +
                                        1) %
                                    _ids.length])
                            : null,
                      ),
                    ],
                  ),
                  _space,
                  Row(
                    children: <Widget>[
                      const Text(
                        "Volume",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Expanded(
                        child: Slider(
                          inactiveColor: Colors.transparent,
                          value: _volume,
                          min: 0.0,
                          max: 100.0,
                          divisions: 10,
                          label: '${(_volume).round()}',
                          onChanged: _isPlayerReady
                              ? (value) {
                                  setState(() {
                                    _volume = value;
                                  });
                                  _controller.setVolume(_volume.round());
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
                  _space,
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: _getStateColor(_playerState),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _playerState.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value ?? '',
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700];
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900];
      default:
        return Colors.blue;
    }
  }

  Widget get _space => const SizedBox(height: 10);

  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        color: Colors.blueAccent,
        onPressed: _isPlayerReady
            ? () {
                if (_idController.text.isNotEmpty) {
                  var id = YoutubePlayer.convertUrlToId(
                    _idController.text,
                  );
                  if (action == 'LOAD') _controller.load(id);
                  if (action == 'CUE') _controller.cue(id);
                  FocusScope.of(context).requestFocus(FocusNode());
                } else {
                  _showSnackBar('Source can\'t be empty!');
                }
              }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}

// class _VideoNapzaScreenState extends State<VideoNapzaScreen> {
//   List<String> images = ['assets/images/ganja.jpeg', 'assets/images/kokain.jpg', 'assets/images/ekstasi.png', 'assets/images/morphine-pills.jpg', 'assets/images/morphine-pills.jpg'];
//   List<String> name = ['Sabu', 'Cocain', 'Ekstasy', 'Morfin', 'Obat Penenang'];
//   List<String> detailName = [shabu, cocain, ekstasy, morfin, obatPenenang];
//   List<dynamic> efekNapza = [
//     efekShabu,
//     efekCocain,
//     efekEkstasy,
//     efekMorfin,
//     efekObatPenenang
//   ];
//   YoutubePlayerController _controller = YoutubePlayerController(
//     initialVideoId: 'iLnmTe5Q2Qw',
//     flags: YoutubePlayerFlags(
//       autoPlay: true,
//       mute: true
//     )
//     );
  
//    void listener() {
//     if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
//       setState(() {
//         _playerState = _controller.value.playerState;
//         _videoMetaData = _controller.metadata;
//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: size.height * .45,
//             color: Colors.pink[100],
//             child: Image.asset(
//               'assets/images/Artwork-4.jpg',
//               width: size.width,
//               fit: BoxFit.fill,
//             ),
//           ),
//           Align(
//             alignment: Alignment.topLeft,
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//               child: Container(
//                 margin: EdgeInsets.only(
//                     top: size.height * 0.05, left: size.width * 0.05),
//                 alignment: Alignment.center,
//                 height: 52,
//                 width: 52,
//                 decoration:
//                     BoxDecoration(color: Colors.white, shape: BoxShape.circle),
//                 // child: SvgPicture.asset('assets/icons/menu.svg'),
//                 child: Icon(IconData(58848,
//                     fontFamily: 'MaterialIcons', matchTextDirection: true)),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: size.height * 0.65,
//               decoration: BoxDecoration(
//                 color: Colors.grey[100],
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
//               ),
//               child: YoutubePlayer(
//                 controller: _controller,
//                 showVideoProgressIndicator: true,
//                 progressColors: ProgressBarColors(
//                   playedColor: Colors.amber,
//                   handleColor: Colors.amberAccent
//                 ),
//                 onReady: () {
//                   _controller.addListener(listener);
//                 },
//               )
//             ),
//           )
//           // SafeArea(
//           //   child: Padding(
//           //     padding: const EdgeInsets.symmetric(horizontal: 20),
//           //     child: Column(
//           //       crossAxisAlignment: CrossAxisAlignment.start,
//           //       children: <Widget>[
//           //         Container(
//           //           margin: EdgeInsets.only(top: size.height * 0.01,bottom: size.height * 0.05),
//           //           alignment: Alignment.center,
//           //             child: Text(
//           //             'Jenis-jenis Napza',
//           //             style: Theme.of(context)
//           //                   .textTheme
//           //                   .display1
//           //                   .copyWith(fontWeight: FontWeight.w900),
//           //           ),
//           //         ),
//           //         // SearchBar(),
//           //         Expanded(
//           //           child: GridView.count(
//           //             crossAxisCount: 2,
//           //             childAspectRatio: .85,
//           //             crossAxisSpacing: 20,
//           //             mainAxisSpacing: 20,
//           //             children: <Widget>[
//           //               CategoryCard(
//           //                 title: "Cocain",
//           //                 pictureSrc: "assets/images/cocain.jpeg",
//           //                 press: () {
//           //                   Map payload = {
//           //                     'napza': cocain,
//           //                     'efek': efekCocain,
//           //                   };
//           //                   Navigator.of(context).pushNamed(Routes.detailJenisNapza, arguments: payload);
//           //                 },
//           //               ),
//           //               CategoryCard(
//           //                 title: "Ectasy",
//           //                 pictureSrc: "assets/images/ectasy.jpeg",
//           //                 press: () {
//           //                 },
//           //               ),
//           //               CategoryCard(
//           //                 title: "Ganja",
//           //                 pictureSrc: "assets/images/ganja.jpeg",
//           //                 press: () {
//           //                 },
//           //               ),
//           //               CategoryCard(
//           //                 title: "Morphine",
//           //                 pictureSrc: "assets/images/morphine.jpeg",
//           //                 press: () {
//           //                 },
//           //               ),
//           //               CategoryCard(
//           //                 title: "Obat Penenang",
//           //                 pictureSrc: "assets/images/obat-penenang.jpeg",
//           //                 press: () {
//           //                 },
//           //               ),
//           //             ],
//           //           )
//           //         )
//           //       ],
//           //     ),
//           //   )
//           // )
//         ],
//       ),
//     );
//   }
// }