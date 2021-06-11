import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:musicvic/BottomNavigation/Home/card_model.dart';
import 'package:musicvic/Model/Album.dart';
//import 'package:musicvic/BottomNavigation/MyCollection/MyCollectionPage/album_tab.dart';
import 'package:musicvic/Model/Artist.dart';
import 'package:musicvic/Model/Music.dart';
import 'package:musicvic/Routes/routes.dart';
import 'package:musicvic/core/api/api.dart';

class SquareCard extends StatelessWidget {
  final Music cardModel;

  SquareCard(this.cardModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 12),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, PageRoutes.playFullSong),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadedScaleAnimation(
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network('${Api.music_image_url}${cardModel.musicImage}',
                  height: 105,
                  width: 105,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              cardModel.musicTitle??"",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
class SquareCardAlbum extends StatelessWidget {
  final Album cardModel;

  SquareCardAlbum(this.cardModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 12),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, PageRoutes.playFullSong),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadedScaleAnimation(
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network('${Api.album_image_url}${cardModel.albumImage}',
                  height: 105,
                  width: 105,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              cardModel.albumName??"",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}