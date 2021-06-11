import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:musicvic/BottomNavigation/Home/card_model.dart';
import 'package:musicvic/Model/Artist.dart';
import 'package:musicvic/Routes/routes.dart';
import 'package:musicvic/core/api/api.dart';

class StoryCard extends StatelessWidget {
  final Artist cardModel;

  StoryCard(this.cardModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 12),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, PageRoutes.artistSongs),
        child: Column(
          children: [
            FadedScaleAnimation(
              CircleAvatar(
                radius: 35,
                backgroundImage:
                NetworkImage('${Api.artist_image_url}${cardModel.artistImage}'),
              ),
            ),
            SizedBox(height: 8),
            Text(
              cardModel.artistName??"",
              style:
                  Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
