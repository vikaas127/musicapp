import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:musicvic/Components/advertisement_list.dart';
import 'package:musicvic/Components/radio_channels_list.dart';
import 'package:musicvic/Locale/locale.dart';
import 'package:musicvic/Theme/colors.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class PlayRadioPage extends StatefulWidget {
  @override
  _PlayRadioPageState createState() => _PlayRadioPageState();
}

class _PlayRadioPageState extends State<PlayRadioPage> {
  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var locale = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: bottomNavigationBarColor,
      bottomSheet: SolidBottomSheet(
          draggableBody: true,
          headerBar: Container(
            decoration: BoxDecoration(
                color: bottomNavigationBarColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            height: ht / 1.9,
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
                      vertical: 12.0, horizontal: 16),
                  child: Text(
                    locale.similarRadioChannels,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: darkTextColor),
                  ),
                ),
                RadioChannelList(),
                SizedBox(height: 16.0),
                AdvertisementList(),
              ],
            ),
          ),
          body: Container(
              color: bottomNavigationBarColor,
              constraints: BoxConstraints.expand(),
              child: Column(
                children: [
                  RadioChannelList(),
                  SizedBox(height: 16.0),
                  AdvertisementList(),
                ],
              ))),
      body: FadedSlideAnimation(
        Stack(
          children: [
            Opacity(
                opacity: 0.75,
                child: Image.asset(
                  'assets/Radio/Layer 1686 copy.png',
                  height: ht / 2,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                )),
            Container(
              height: ht / 1.8,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Theme.of(context).disabledColor, transparentColor],
                    stops: [0.18, 0.65],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  ListTile(
                    leading: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios)),
                    trailing: Icon(Icons.more_horiz),
                  ),
                  SizedBox(
                    height: ht / 6,
                  ),
                  Text(
                    '72.8 ' + locale.chartBuster,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Opacity(
                      opacity: 0.7,
                      child: Text(
                        '12,12,574 ' + locale.listeners,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontSize: 12),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.favorite_border), onPressed: () {}),
                      Spacer(),
                      CircleAvatar(
                          radius: 30,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: GestureDetector(
                              child: Icon(
                            Icons.play_arrow,
                            color: Theme.of(context).highlightColor,
                            size: 40,
                          ))),
                      Spacer(),
                      IconButton(icon: Icon(Icons.share), onPressed: () {})
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
