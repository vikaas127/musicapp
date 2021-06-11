import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicvic/BottomNavigation/Home/card_model.dart';
import 'package:musicvic/Components/advertisement_list.dart';
import 'package:musicvic/Components/explore_by_genre.dart';
import 'package:musicvic/Components/horizontal_list.dart';
import 'package:musicvic/Components/radio_channels_list.dart';
import 'package:musicvic/Components/title_text.dart';
import 'package:musicvic/Locale/locale.dart';

class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: FadedScaleAnimation(
          Text(
            locale.radio,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontSize: 28, fontWeight: FontWeight.w600),
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Theme.of(context).highlightColor,
              ),
              onPressed: () {})
        ],
      ),
      body: ListView(
        padding: EdgeInsetsDirectional.only(start: 16, bottom: 72),
        physics: BouncingScrollPhysics(),
        children: [
          TitleText(locale.liveRadio),
          RadioChannelList(),
          SizedBox(height: 16),
          TitleText(locale.moodPlaylist),
          //ExploreByGenre(width: MediaQuery.of(context).size.width / 4.25),
          TitleText(locale.artistRadio),
         // HorizontalList(height: 100, list: artistRadioList, type: 'artist'),
          SizedBox(height: 16),
          AdvertisementList(),
        ],
      ),
    );
  }
}
