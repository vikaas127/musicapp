import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:musicvic/Locale/locale.dart';
import 'package:musicvic/Model/category.dart';

class Genre {
  final String genre;
  final Color color;

  Genre(this.genre, this.color);
}

class ExploreByGenre extends StatelessWidget {
  final List<category> genres;
  const ExploreByGenre({ Key key, @required this.genres}): super(key: key);
  //ExploreByGenre({this.width,}):;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    final double screenWidth = MediaQuery.of(context).size.width;
   /* List<category> genres = [
      Genre(locale.party, Colors.blue),
      Genre(locale.romance, Colors.red),
      Genre(locale.retro, Colors.yellow.shade800),
      Genre(locale.rocking, Colors.green),
      Genre(locale.remix, Colors.deepPurple),
    ];*/

    return FadedScaleAnimation(
      Container(
        height: 36,
        margin: EdgeInsets.only(bottom: 12),
        child: ListView.builder(
          itemCount: genres.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsetsDirectional.only(end: 8.0),
                width: screenWidth/4.65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.green,
                ),
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(genres[index].categoryName??"vik",
                  style: Theme.of(context).textTheme.caption,
                )),
              ),
            );
          },
        ),
      ),
    );
  }
}
