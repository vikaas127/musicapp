import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:musicvic/Locale/locale.dart';
import 'package:musicvic/Theme/colors.dart';
import '../my_collection_navigator.dart';

class Playlist {
  String title;
  String subtitle;

  Playlist(this.title, this.subtitle);
}

class PlayListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<String> gridImages = [
      'assets/Avatars/stories/New folder/album cover/Layer 941.png',
      'assets/Avatars/stories/New folder/album cover/Layer 942.png',
      'assets/Avatars/stories/New folder/album cover/Layer 943.png',
      'assets/Avatars/stories/New folder/album cover/Layer 946.png',
    ];
    List<Playlist> playListItems = [
      Playlist(locale.likedSongs, '15 ' + locale.songs),
      Playlist(locale.hipHopper, '26 ' + locale.songs),
      Playlist(locale.likedSongs, '15 ' + locale.songs),
      Playlist(locale.hipHopper, '26 ' + locale.songs),
    ];
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, CollectionRoutes.playlist),
                child: Padding(
                  padding: EdgeInsets.only(top: index == 0 ? 30.0 : 0.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 110,
                        width: 110,
                        child: GridView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return FadedScaleAnimation(
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      image: DecorationImage(
                                          image:
                                              AssetImage(gridImages[index]))),
                                ),
                              );
                            }),
                      ),
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: playListItems[index].title + '\n',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(height: 1.5)),
                        TextSpan(
                            text: playListItems[index].subtitle,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(
                                    color: lightTextColor,
                                    height: 1.4,
                                    fontSize: 13)),
                      ]))
                    ],
                  ),
                ),
              );
            }),
        SizedBox(
          height: 120,
        ),
      ],
    );
  }
}
