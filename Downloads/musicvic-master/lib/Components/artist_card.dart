import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:musicvic/BottomNavigation/Home/card_model.dart';
import 'package:musicvic/Model/Artist.dart';
import 'package:musicvic/Routes/routes.dart';
import 'package:musicvic/core/api/api.dart';

class ArtistCard extends StatelessWidget {
  final Artist cardModel;

  ArtistCard(this.cardModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 12),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, PageRoutes.artistSongs),
        child: Column(
          children: [
            Stack(
              children: [
                FadedScaleAnimation(
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network('${Api.artist_image_url}${cardModel.artistImage}', height: 70),
                  ),
                ),
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  top: 3,
                  end: 3,
                  child: CircleAvatar(
                      radius: 9,
                      backgroundColor: Theme.of(context).highlightColor,
                      child: Icon(
                        Icons.play_arrow,
                        color: Theme.of(context).disabledColor,
                        size: 14,
                      )),
                ),
              ],
            ),
            SizedBox(height: 6),
            Text(
              cardModel.artistName,
              style: Theme.of(context).textTheme.overline,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
