import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicvic/Locale/locale.dart';
import 'package:musicvic/Routes/routes.dart';
import 'package:musicvic/Theme/colors.dart';

class SubscribePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubscribeBody();
  }
}

class SubscribeBody extends StatefulWidget {
  @override
  _SubscribeBodyState createState() => _SubscribeBodyState();
}

class _SubscribeBodyState extends State<SubscribeBody> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          locale.subscribe,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: FadedSlideAnimation(
        Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              SubscribeTile(
                subscriptionTime: '3 ' + locale.months,
                price: '\$ 9.99',
                packName: locale.starterPack,
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.subscribedPage);
                },
              ),
              SizedBox(height: 10.0),
              SubscribeTile(
                subscriptionTime: '6 ' + locale.months,
                price: '\$ 14.99',
                packName: locale.standardPack,
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.subscribedPage);
                },
              ),
              SizedBox(height: 10.0),
              SubscribeTile(
                subscriptionTime: '12 ' + locale.months,
                price: '\$ 23.99',
                packName: locale.superSaverPack,
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.subscribedPage);
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 44.0, bottom: 16.0),
                child: Text(
                  locale.subscriptionAllows,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: lightTextColor),
                ),
              ),
              buildListFeaturesTile(context, locale.feature1),
              buildListFeaturesTile(context, locale.feature2),
              buildListFeaturesTile(context, locale.feature3),
              buildListFeaturesTile(context, locale.feature4),
            ],
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  ListTile buildListFeaturesTile(BuildContext context, String feature) {
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

class SubscribeData {
  final String subscriptionTime;
  final String price;

  SubscribeData(this.subscriptionTime, this.price);
}

class SubscribeTile extends StatelessWidget {
  final String subscriptionTime;
  final String price;
  final String packName;
  final Function onTap;

  SubscribeTile({this.subscriptionTime, this.price, this.onTap, this.packName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Container(
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              image: DecorationImage(
                  image: AssetImage('assets/subscribebg.png'),
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            top: 28.0,
            left: 25.0,
            child: Text(
              packName.toUpperCase(),
              style: TextStyle(
                  color: Theme.of(context).highlightColor, letterSpacing: 2.4),
            ),
          ),
          Positioned(
            bottom: 30.0,
            left: 25.0,
            child: Text(
              subscriptionTime.toUpperCase(),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Positioned(
            bottom: 30.0,
            right: 25.0,
            child: Text(
              price,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
