import 'package:flutter/material.dart';
import 'package:musicvic/Locale/locale.dart';
import 'album_tab.dart';
import '../artist_tab.dart';
import 'playlist_tab.dart';

class MyCollectionPage extends StatefulWidget {
  @override
  _MyCollectionPageState createState() => _MyCollectionPageState();
}

class _MyCollectionPageState extends State<MyCollectionPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: TabBar(
                  labelStyle: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontSize: 18),
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Theme.of(context).primaryColor,
                  tabs: [
                    Tab(
                      text: locale.playlist,
                    ),
                    Tab(
                      text: locale.album,
                    ),
                    Tab(
                      text: locale.artist,
                    ),
                  ]),
            ),
          ),
          automaticallyImplyLeading: false,
          title: Text(
            locale.myCollection,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.w600, fontSize: 28),
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            PlayListTab(),
            AlbumTab(),
            ArtistTab(),
          ],
        ),
      ),
    );
  }
}
