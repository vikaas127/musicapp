import 'package:animation_wrappers/Animations/faded_slide_animation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicvic/Components/continue_button.dart';
import 'package:musicvic/Locale/locale.dart';
import 'package:musicvic/Routes/routes.dart';

class SubscribedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    var locale = AppLocalizations.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacer(),
              Image.asset(
                'assets/payment successful.png',
                height: screenWidth / 2,
                width: screenWidth / 1.5,
              ),
              Spacer(),
              Center(
                child: Text(
                  'Hola',
                  style: TextStyle(fontSize: 28.0),
                ),
              ),
              Center(
                child: Text(
                  '\n' + locale.subscribedNow,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Spacer(),
              buildFeaturesTile(context, locale.feature1),
              buildFeaturesTile(context, locale.feature2),
              buildFeaturesTile(context, locale.feature3),
              buildFeaturesTile(context, locale.feature4),
              Spacer(),
              ContinueButton(
                () {
                  Navigator.pushNamed(context, PageRoutes.paymentFailed);
                },
                text: locale.exploreNow,
              )
            ],
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  ListTile buildFeaturesTile(BuildContext context, String feature) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      leading: Icon(
        Icons.check_circle,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        feature,
        style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 14),
      ),
    );
  }
}
