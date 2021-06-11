import 'package:flutter/material.dart';
import 'package:musicvic/BottomNavigation/Home/card_model.dart';
//import 'package:musicvic/BottomNavigation/MyCollection/MyCollectionPage/album_tab.dart';
import 'package:musicvic/Components/artist_card.dart';
import 'package:musicvic/Components/square_card.dart';
import 'package:musicvic/Components/story_card.dart';
import 'package:musicvic/Model/Album.dart';
import 'package:musicvic/Model/Artist.dart';
import 'package:musicvic/Model/Music.dart';
import 'package:musicvic/Model/category.dart';

class HorizontalList extends StatelessWidget {
  final double height;
  final List<Artist> list;
  final String type;

  HorizontalList({this.height, this.list, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {
            if (type == 'circle') {
              return StoryCard(list[index]);
            }
           //   return ArtistCard(list[index]);

          }),
    );
  }
}
class HorizontalListMusic extends StatelessWidget {
  final double height;
  final List<Music> list;
  final String type;

  HorizontalListMusic({this.height, this.list, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {

              return SquareCard(list[index]);

          }),
    );
  }
}
class HorizontalListAlbum extends StatelessWidget {
  final double height;
  final List<Album> list;
  final String type;

  HorizontalListAlbum({this.height, this.list, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {

              return SquareCardAlbum(list[index]);

          }),
    );
  }
}/*
class HorizontalListcat extends StatelessWidget {
  final double height;
  final List<category> list;
  final String type;

  HorizontalListcat({this.height, this.list, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {
            if (type == 'circle') {
              return StoryCard(list[index]);
            } else if (type == 'artist') {
              return ArtistCard(list[index]);
            } else {
              return SquareCard(list[index]);
            }
          }),
    );
  }
}*/
