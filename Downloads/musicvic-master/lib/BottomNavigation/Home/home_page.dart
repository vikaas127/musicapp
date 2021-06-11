import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:musicvic/BottomNavigation/MyCollection/MyCollectionPage/album_tab.dart';
import 'package:musicvic/Components/horizontal_list.dart';
import 'package:musicvic/Components/advertisement_list.dart';
import 'package:musicvic/Components/explore_by_genre.dart';
import 'package:musicvic/Components/title_text.dart';
import 'package:musicvic/Locale/locale.dart';
import 'package:musicvic/Model/Artist.dart';
import 'package:musicvic/Model/Music.dart';
import 'package:musicvic/Model/category.dart';
import 'package:musicvic/Model/Album.dart';
import 'package:musicvic/Model/slider.dart';
//import 'package:musicvic/Model/slider.dart';
import 'package:musicvic/Routes/routes.dart';
import 'package:musicvic/core/services/auth_service.dart';
import 'card_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeBody();
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  AuthService authService = Get.put(AuthService());
 // List<homecomp> _list;
  List<Music> newlyLaunched=new List();
  List<Artist>stories= new List() ;
  List<Album> PopularAlbums= new List();
  List<Album> RecommendedAlbum= new List();
 // List<Album> PopularAlbums = new List();
  List<Music> recentlyPlayed= new List();
  List<Music> MostPlayed= new List();
  List<Music> RecommendedMusic= new List();
  List<Artist> FavouriteArtists =new List();
  List<category> categoryl= new List();
  List<dynamic> datahome= new List();
  List<Slidert> slider= new List();
  @override
  void initState() {
    authService.homecomp().then((value) {

     // _list= new List();

     print(value.body.toString());
      datahome= jsonDecode(value.body);
     print("datataa");
     print(datahome);
     datahome.map((e) {
       setState(() {


       //_list.add(homecomp.fromJson(e));
        datahome[0]['data'].map((ef){
          stories.add(Artist.fromJson(ef));
       }).toList();
        datahome[1]['data'].map((ef){
          MostPlayed.add(Music.fromJson(ef));
        }).toList();
        datahome[2]['data'].map((af){
          PopularAlbums.add(Album.fromJson(af));
        }).toList();
        datahome[3]['data'].map((ef){
          slider.add(Slidert.fromJson(ef));
        }).toList();
        datahome[4]['data'].map((ef){
        //  RecommendedAlbum.add(Album.fromJson(ef));
        }).toList();
        datahome[5]['data'].map((ef){
          categoryl.add(category.fromJson(ef));
        }).toList();
        datahome[6]['data'].map((ef){
          stories.add(Artist.fromJson(ef));
        }).toList();

        datahome[7]['data'].map((rf){

          recentlyPlayed.add(Music.fromJson(rf));
        }).toList();





        datahome[0]['data'].map((ef){
          stories.add(Artist.fromJson(ef));
        }).toList();
        print( datahome[7]['data'][0]);

print(stories);
print(recentlyPlayed[0]);
       });
     }).toList();
     print(value.statusCode);

      if (value.statusCode == 200) {

      } else {
        Get.snackbar("Error", "Incorrect  phonenumber");
      }
    });
    // authService.login("vikas090497@gmail.com", password)

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: FadedScaleAnimation(Image.asset('assets/logo.png', scale: 5)),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).highlightColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, PageRoutes.settingsPage);
              })
        ],
      ),
      body:datahome.length==null?Center(child: CircularProgressIndicator()): ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsetsDirectional.only(start: 16, top: 16, bottom: 72),
        children: <Widget>[
          HorizontalList(height: 100, list: stories, type: 'circle'),
          TitleText(datahome[1]['name']??""),
          HorizontalListMusic(height: 136, list: MostPlayed),

          ///Recently launched
          TitleText(datahome[2]['name']),
          HorizontalListAlbum(height: 136, list:PopularAlbums ),

          ///Mood playlist
          TitleText(datahome[6]['name']),
          ExploreByGenre(genres: categoryl,),

          ///Advertisements
          AdvertisementList(ads:slider ,),
          SizedBox(height: 8),

          ///Newly launched
          TitleText(datahome[7]['name']),
          HorizontalListMusic(height: 136, list: recentlyPlayed),
        ],
      ),
    );
  }
}
