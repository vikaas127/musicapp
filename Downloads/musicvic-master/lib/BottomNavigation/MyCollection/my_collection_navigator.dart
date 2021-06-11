import 'package:flutter/material.dart';
import 'package:musicvic/BottomNavigation/MyCollection/MyCollectionPage/my_collection.dart';
import 'package:musicvic/BottomNavigation/MyCollection/playlist_songs.dart';
import 'package:musicvic/BottomNavigation/MyCollection/add_new_artist.dart';

import 'album_songs.dart';
import 'MyCollectionPage/artist_songs.dart';

GlobalKey<NavigatorState> collectionNavigatorKey = GlobalKey<NavigatorState>();

class CollectionRoutes {
  static const String collectionRoot = 'collection/';
  static const String playlist = 'collection/playlist';
  static const String album = 'collection/album';
  static const String artist = 'collection/artist';
  static const String addNewArtist = 'collection/new_artist';
}

class MyCollectionNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var canPop = collectionNavigatorKey.currentState.canPop();
        if (canPop) {
          collectionNavigatorKey.currentState.pop();
        }
        return !canPop;
      },
      child: Navigator(
        key: collectionNavigatorKey,
        initialRoute: CollectionRoutes.collectionRoot,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case CollectionRoutes.collectionRoot:
              builder = (BuildContext _) => MyCollectionPage();
              break;
            case CollectionRoutes.playlist:
              builder = (BuildContext _) => PlayListSongs();
              break;
            case CollectionRoutes.album:
              builder = (BuildContext _) => AlbumSongs();
              break;
            case CollectionRoutes.artist:
              builder = (BuildContext _) => ArtistSongs();
              break;
            case CollectionRoutes.addNewArtist:
              builder = (BuildContext _) => AddNewArtist();
              break;
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
        onPopPage: (Route<dynamic> route, dynamic result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
