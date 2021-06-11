import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:musicvic/Locale/locale.dart';
import 'package:musicvic/Theme/colors.dart';
import '../../constants.dart';

class PlayListSongs extends StatefulWidget {
  @override
  _PlayListSongsState createState() => _PlayListSongsState();
}

class PlayListSong {
  String image;
  String name;
  String album;

  PlayListSong(this.image, this.name, this.album);
}

class _PlayListSongsState extends State<PlayListSongs> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    var ht = MediaQuery.of(context).size.height;
    return Scaffold(
      // bottomNavigationBar: BottomNavigation(),
      body: FadedSlideAnimation(
        Stack(
          children: [
            Opacity(
                opacity: 0.6,
                child: Image.asset(
                  'assets/playList_header.jpg',
                  height: ht / 2.2,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                )),
            Container(
              height: ht / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Theme.of(context).disabledColor, transparentColor],
                    stops: [0.22, 0.5],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
              ),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                  ),
                  SizedBox(
                    height: ht / 5,
                  ),
                  Text(
                    locale.retroHits,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Opacity(
                      opacity: 0.7,
                      child: Text(
                        '58 ' + locale.songs,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontSize: 12),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 16),
                        child: Text(
                          locale.shufflePlay,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: 25, bottom: 100),
                        // shrinkWrap: true,
                        itemCount: songsList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            focusColor: transparentColor,
                            hoverColor: transparentColor,
                            onTap: () => _settingModalBottomSheet(),
                            leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  songsList[index].image,
                                  height: 40,
                                  width: 40,
                                )),
                            title: Text(
                              songsList[index].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(fontSize: 15),
                            ),
                            subtitle: Text(
                              songsList[index].album,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                      color: lightTextColor, fontSize: 11),
                            ),
                            trailing: Icon(Icons.more_horiz),
                          );
                        }),
                  )
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

  void _settingModalBottomSheet() {
    var locale = AppLocalizations.of(context);

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              color: bottomNavigationBarColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/Avatars/stories/New folder/album cover/Layer 942.png',
                        height: 40,
                        width: 40,
                      )),
                  title: Text(
                    'Love me like you do',
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
                ),
                Container(
                  child: Wrap(
                    children: <Widget>[
                      buildBottomSheetOption(
                          context, Icons.favorite_border, locale.likeIt),
                      buildBottomSheetOption(
                          context, Icons.remove_circle_outline, locale.remove),
                      buildBottomSheetOption(
                          context, Icons.queue_music, locale.addToPlaylist),
                      buildBottomSheetOption(
                          context, Icons.skip_next, locale.playNext),
                      buildBottomSheetOption(
                          context, Icons.album, locale.goToAlbum),
                      buildBottomSheetOption(
                          context, Icons.account_circle, locale.viewArtist),
                      buildBottomSheetOption(
                          context, Icons.share, locale.share),
                      SizedBox(
                        height: 170,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  ListTile buildBottomSheetOption(context, IconData icon, String title) {
    return ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
        leading: new Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        title: new Text(title),
        onTap: () => {});
  }
}
