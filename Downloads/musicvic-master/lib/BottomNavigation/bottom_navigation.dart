import 'dart:async';
import 'package:flutter/material.dart';
import 'package:musicvic/BottomNavigation/MyCollection/my_collection_navigator.dart';
import 'package:musicvic/BottomNavigation/Radio/radio_page.dart';
import 'package:musicvic/BottomNavigation/Search/search_page.dart';
import 'package:musicvic/Pages/song_play.dart';
import 'package:musicvic/Routes/routes.dart';
import 'package:musicvic/Theme/colors.dart';
import 'Home/home_page.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  double _progress;
  Timer _timer;

  _startTimer() {
    //shows timer
    _progress = 0; //time counter

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _progress <= 1 ? _progress += 0.06 : _timer.cancel();
      });
    });
  }

  final List<Widget> _children = [
    HomePage(),
    SearchPage(),
    RadioPage(),
    MyCollectionNavigator(),
  ];

  final List<BottomNavigationBarItem> _bottomBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.radio),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.queue_music),
      label: '',
    ),
  ];

  @override
  void initState() {
    super.initState();

    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _children[_currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onVerticalDragEnd: (details) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SongPlayPage()),
                );

                Navigator.pushNamed(context, PageRoutes.playFullSong);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).disabledColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(28))),
                padding: EdgeInsets.fromLTRB(6, 6, 6, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: LinearProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor),
                          value: _progress,
                        )),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: bottomNavigationBarColor,
                          borderRadius: BorderRadius.circular(28)),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: Theme.of(context).highlightColor,
                            ),
                            onPressed: () {},
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Last Breath' + '\n',
                                  style: Theme.of(context).textTheme.bodyText2),
                              TextSpan(
                                  text: 'Holiday | Adams Terena',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                          fontSize: 11,
                                          color: darkTextColor,
                                          height: 1.4)),
                            ]),
                          ),
                          Spacer(),
                          Hero(
                            tag: 'image',
                            child: Opacity(
                                opacity: 0.2,
                                child: Image.asset(
                                  'assets/Avatars/stories/New folder/album cover/Layer 941.png',
                                  width: 100,
                                  fit: BoxFit.fitWidth,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Hero(
                              tag: 'playButton',
                              child: GestureDetector(
                                onTap: () {

                                },
                                child: CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).highlightColor,
                                  child: Icon(Icons.play_arrow),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Theme.of(context).disabledColor,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        items: _bottomBarItems,
        onTap: onTap,
      ),
    );
  }
}
