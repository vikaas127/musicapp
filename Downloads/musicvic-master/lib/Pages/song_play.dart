import 'dart:async';
import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicvic/Controller.dart';
//import 'package:music_player/music_player.dart';
import 'package:musicvic/Locale/locale.dart';
import 'package:musicvic/Model/musicplayer.dart';
import 'package:musicvic/Theme/colors.dart';
import 'package:musicvic/constants.dart';
import 'package:musicvic/core/api/api.dart';
import 'package:musicvic/core/services/musicplayerservice.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class SongPlayPage extends StatefulWidget {
  @override
  _SongPlayPageState createState() => _SongPlayPageState();
}

class _SongPlayPageState extends State<SongPlayPage> {
  double _progress;
  Timer _timer;

//  MusicPlayer musicPlayer;
  _startTimer() {
    //shows timer
    _progress = 0; //time counter

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _progress <= 1 ? _progress += 0.06 : _timer.cancel();
      });
    });
  }
  bool playing = false; // at the begining we are not playing any song
  IconData playBtn = Icons.play_arrow; // the main state of the play button icon
  static const kUrl1 = 'https://luan.xyz/files/audio/ambient_c_motion.mp3';
  static const kUrl2 = 'https://luan.xyz/files/audio/nasa_on_a_mission.mp3';
  static const kUrl3 = 'http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p';

  //Now let's start by creating our music player
  //first let's declare some object
  AudioPlayer _player;
  AudioCache cache;
 List <Playlist>_playlist= new List();
  Musicplayer  _musicplayer;
  Duration position = new Duration();
  Duration musicLength = new Duration();
  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: Colors.blue[800],
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }
  MusicService musicService = Get.put(MusicService());
  //let's create the seek function that will allow us to go to a certain position of the music
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
    initPlatformState();
 musicService.musicplayer("28", "28").then((value) {
   setState(() {
     var Response= jsonDecode(value.body);
     print(Response);
_musicplayer= Musicplayer.fromJson(Response);
     Response['playlist'].map((e){
       _playlist.add( Playlist.fromJson(e)) ;
       print(_playlist[0].albumId);
     }).toList();
   });
 });
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    //now let's handle the audioplayer time

    //this function will allow you to get the music duration
    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };

    //this function will allow us to move the cursor of the slider while we are playing the song
    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };


}

  Future<void> initPlatformState() async {
   // musicPlayer = MusicPlayer();
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var locale = AppLocalizations.of(context);
    return Scaffold(
      body:GetBuilder<MusicController>(
        id: 'aVeryUniqueID', // here
        init: MusicController(),
        builder: (value) =>

       FadedSlideAnimation(
        Stack(
          children: [
            Hero(
              tag: 'image',
              child: Opacity(
                  opacity: 0.6,
                  child: Image.network(
                    '${Api.music_image_url}${_musicplayer.musicImage}' /*assets/playList_header.jpg*/,
                    height: ht / 1.6,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  )),
            ),
            Container(
              height: ht / 1.1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Theme.of(context).disabledColor, transparentColor],
                    stops: [0.33, 0.67],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
              ),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    leading: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                        )),
                    trailing: Icon(Icons.more_horiz, size: 30),
                  ),
                  SizedBox(
                    height: ht / 3.5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child:
                    Container(
                      height: 100,
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: Theme.of(context).textTheme.subtitle1.copyWith(
                                  color: songSubtitleColor,
                                  fontSize: 14,
                                  height: 1.8),
                              children: <TextSpan>[
                                TextSpan(text: '${_musicplayer.lyrics}'),

                              ])),
                    ),
                  ),
                  SizedBox(
                    height: ht / 40,
                  ),
                  Text(
                    _musicplayer.musicTitle,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: ht / 70,
                  ),
                  Text(
                  '${_musicplayer.albumName}| ${_musicplayer.artists[0].artistName}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: lightTextColor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: ht / 40,
                  ),
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.favorite_border), onPressed: () {

                        musicService.Like("Music", "28").then((value) {
                          setState(() {
                            var Response= jsonDecode(value.body);
                            print(Response);
                         //   _musicplayer= Musicplayer.fromJson(Response);
                          });
                        });
                      }),
                      Spacer(),
                      IconButton(
                          icon: Icon(Icons.fast_rewind), onPressed: () {}),
                      Spacer(),
                      Hero(
                        tag: 'playButton',
                        child: GestureDetector(
                          onTap: () {
    if (!playing) {
    //now let's play the song
    _player.play('${Api.audio_url}${_musicplayer.musicFile}');
        //.play("Stargazer.mp3");
    setState(() {
    playBtn = Icons.pause;
    playing = true;
    });
    } else {
    _player.pause();
    setState(() {
    playBtn = Icons.play_arrow;
    playing = false;
    });
    }


                          },
                          child: CircleAvatar(
                            radius: 32,
                            foregroundColor: Theme.of(context).highlightColor,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Icon(
                              playBtn,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          icon: Icon(Icons.fast_forward), onPressed: () {


                      }),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.queue_music),
                        onPressed: () {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: ht / 95,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    child: Row(
                      children: [Text('02:33'), Spacer(), Text('${_musicplayer.musicDuration}')],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: LinearProgressIndicator(
                        minHeight: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor),
                        value: _progress,
                      )),
                  Spacer(
                    flex: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),),
      bottomSheet: SolidBottomSheet(
          maxHeight: 300,
          draggableBody: true,
          headerBar: Container(
            decoration: BoxDecoration(
                color: bottomNavigationBarColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    width: 80,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).unselectedWidgetColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        locale.comingUpNext,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(color: darkTextColor),
                      ),
                      Spacer(),
                      Text(
                        'Shuffle',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(color: darkTextColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.shuffle,
                        color: Theme.of(context).highlightColor,
                        size: 20,
                      )
                    ],
                  ),
                ),
              /*  ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/Avatars/stories/New folder/album cover/Layer 941.png',
                        height: 40,
                        width: 40,
                      )),
                  title: Text(
                    'Like the way you look',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontSize: 15),
                  ),
                  subtitle: Text(
                    'Last Love | Adverd Johny',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: lightTextColor, fontSize: 11),
                  ),
                  trailing: Icon(Icons.more_horiz),
                )*/
              ],
            ),
          ),
          body: Container(
              color: bottomNavigationBarColor,
              // constraints: BoxConstraints.expand(),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _playlist.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: (){

                      },
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network('${Api.music_image_url}${
                            _playlist[index].musicImage}',
                            height: 40,
                            width: 40,
                          )),
                      title: Text(
                        _playlist[index].musicTitle,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontSize: 15),
                      ),
                      subtitle: Text(
                        _playlist[index].musicTitle,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: lightTextColor, fontSize: 11),
                      ),
                      trailing: Icon(Icons.more_horiz),
                    );
                  }))),
    );
  }
}
