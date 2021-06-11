import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:musicvic/Locale/locale.dart';
import 'package:musicvic/Theme/colors.dart';

import 'my_collection_navigator.dart';

class Artist {
  String image;
  String title;
  String subtitle;

  Artist(this.image, this.title, this.subtitle);
}

class ArtistTab extends StatefulWidget {
  @override
  _ArtistTabState createState() => _ArtistTabState();
}

class _ArtistTabState extends State<ArtistTab> {
  @override
  Widget build(BuildContext context) {
    List<Artist> artistItems = [
      Artist('assets/Avatars/Change pic copy.png', 'Abd Resol', '1,22,145'),
      Artist('assets/Avatars/Layer 1169.png', 'Adams Terena', '4,82,187'),
      Artist('assets/Avatars/Layer 1169-1.png', 'Afro Jacks', '5,38,466'),
      Artist('assets/Avatars/Layer 1170.png', 'Aks Williamson', '3,22,148'),
      Artist('assets/Avatars/Layer 1171.png', 'Bohem Hesion', '3,22,148'),
      Artist('assets/Avatars/Layer 1169-1.png', 'Afro Jacks', '5,38,466'),
      Artist('assets/Avatars/Layer 1170.png', 'Aks Williamson', '3,22,148'),
      Artist('assets/Avatars/Layer 1171.png', 'Bohem Hesion', '3,22,148'),
    ];
    var locale = AppLocalizations.of(context);
    return FadedSlideAnimation(
      ListView(
        physics: BouncingScrollPhysics(),
        children: [
          InkWell(
            onTap: () =>
                Navigator.pushNamed(context, CollectionRoutes.addNewArtist),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 30.0, left: 15, right: 15, bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: languageDisabledColor,
                        borderRadius: BorderRadius.circular(8)),
                    height: 80,
                    width: 80,
                    child: Icon(Icons.add),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  RichText(
                      text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: locale.addNewArtist + '\n',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(height: 1.5)),
                  ]))
                ],
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: artistItems.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, CollectionRoutes.artist),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 0, left: 15, right: 15, bottom: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset(artistItems[index].image),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: artistItems[index].title + '\n',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(height: 1.5)),
                          TextSpan(
                              text: artistItems[index].subtitle,
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
          )
        ],
      ),
      beginOffset: Offset(0, 0.3),
      endOffset: Offset(0, 0),
      slideCurve: Curves.linearToEaseOut,
    );
  }
}
