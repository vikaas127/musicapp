import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicvic/Locale/locale.dart';
import 'package:musicvic/Routes/routes.dart';
import 'package:musicvic/Settings/preferences_tab.dart';
import 'package:musicvic/Settings/profile_tab.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSubscribed = false;
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, PageRoutes.subscriptionPage);
                      isSubscribed = !isSubscribed;
                    });
                  },
                  child: Container(
                    height: 55,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage('assets/subscribebg.png'),
                            fit: BoxFit.fill)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: isSubscribed
                          ? Row(
                              children: [
                                Text(locale.youAreSubscribed,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(fontSize: 18)),
                                Spacer(),
                                Text(
                                  '20 DAYS LEFT',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontSize: 12),
                                ),
                              ],
                            )
                          : Center(
                              child: Text(
                              locale.upgradeTo + ' Musicvic ' + locale.premium,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(fontSize: 18),
                            )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TabBar(
                  labelStyle: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontSize: 18),
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Theme.of(context).primaryColor,
                  tabs: [
                    Tab(text: locale.preference),
                    Tab(text: locale.profile),
                  ],
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: true,
          title: Text(
            locale.settings,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            FadedSlideAnimation(
              PreferenceTab(),
              beginOffset: Offset(0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
            FadedSlideAnimation(
              ProfileTab(),
              beginOffset: Offset(0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
          ],
        ),
      ),
    );
  }
}
