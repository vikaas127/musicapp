import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:musicvic/Routes/routes.dart';
import 'package:musicvic/Theme/colors.dart';

class RadioInfo {
  String image;
  String name;
  String frequency;

  RadioInfo(this.image, this.name, this.frequency);
}

List<RadioInfo> liveRadio = [
  RadioInfo('assets/Radio/Layer 1686 copy.png', 'Chartbuster', '72.8'),
  RadioInfo('assets/Radio/Layer 1694.png', 'Old Retrofy', '92.6'),
  RadioInfo('assets/Radio/Layer 1694-1.png', 'Remixer', '99.4'),
  RadioInfo('assets/Radio/Layer 1686 copy.png', 'Chartbuster', '72.8'),
  RadioInfo('assets/Radio/Layer 1694.png', 'Old Retrofy', '92.6'),
  RadioInfo('assets/Radio/Layer 1694-1.png', 'Remixer', '99.4'),
];

class RadioChannelList extends StatefulWidget {
  @override
  _RadioChannelListState createState() => _RadioChannelListState();
}

class _RadioChannelListState extends State<RadioChannelList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: liveRadio.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.playRadio);
              },
              child: Stack(
                children: [
                  FadedScaleAnimation(
                    Container(
                      margin: EdgeInsetsDirectional.only(end: 12),
                      width: MediaQuery.of(context).size.width / 2.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(liveRadio[index].image),
                            fit: BoxFit.cover,
                          )),
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                            colors: [
                              bottomNavigationBarColor,
                              Colors.transparent
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                      ),
                    ),
                  ),
                  Positioned.directional(
                    textDirection: Directionality.of(context),
                    start: 14,
                    bottom: 14,
                    child: RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: liveRadio[index].frequency + ' ',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.w600)),
                      TextSpan(text: 'fm\n'),
                      TextSpan(text: liveRadio[index].name),
                    ])),
                  )
                ],
              ),
            );
          }),
    );
  }
}
