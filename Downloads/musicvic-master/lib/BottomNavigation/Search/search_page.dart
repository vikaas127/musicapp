import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicvic/BottomNavigation/Home/card_model.dart';
import 'package:musicvic/Components/horizontal_list.dart';
import 'package:musicvic/Components/entry_field.dart';
import 'package:musicvic/Components/explore_by_genre.dart';
import 'package:musicvic/Components/title_text.dart';
import 'package:musicvic/Locale/locale.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> recommendations = [
    'assets/Avatars/stories/New folder/album cover/Layer 941.png',
    'assets/Avatars/stories/New folder/album cover/Layer 942.png',
    'assets/Avatars/stories/New folder/album cover/Layer 943.png',
    'assets/Avatars/stories/New folder/album cover/Layer 946.png',
    'assets/Avatars/stories/New folder/album cover/Layer 948.png',
    'assets/Avatars/stories/New folder/album cover/Layer 949.png',
    'assets/Avatars/stories/New folder/album cover/Layer 941.png',
    'assets/Avatars/stories/New folder/album cover/Layer 942.png',
    'assets/Avatars/stories/New folder/album cover/Layer 943.png',
  ];
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsetsDirectional.only(start: 16, top: 44, bottom: 72),
        children: [
          FadedScaleAnimation(
            Text(
              locale.whatWouldYouLike,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 28),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 20, 36, 8),
            child: EntryField(
              noBorder: false,
              prefix: Icon(
                Icons.search,
                color: Theme.of(context).highlightColor,
              ),
              hint: locale.searchSongs,
            ),
          ),
          TitleText(locale.newlyLaunched),
        //  HorizontalList(height: 136, list: newlyLaunched),
          TitleText(locale.whichGenres),
       //   ExploreByGenre(width: MediaQuery.of(context).size.width / 4.25),
          TitleText(locale.recommendedForYou),
          GridView.builder(
            padding: EdgeInsetsDirectional.only(end: 16),
            physics: NeverScrollableScrollPhysics(),
            itemCount: recommendations.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child:
                      FadedScaleAnimation(Image.asset(recommendations[index])));
            },
          ),
        ],
      ),
    );
  }
}
