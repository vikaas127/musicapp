import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:musicvic/Theme/colors.dart';
import '../my_collection_navigator.dart';

class Album {
  String image;
  String title;
  String subtitle;

  Album(this.image, this.title, this.subtitle);
}

class AlbumTab extends StatefulWidget {
  @override
  _AlbumTabState createState() => _AlbumTabState();
}

class _AlbumTabState extends State<AlbumTab> {
  @override
  Widget build(BuildContext context) {
    List<Album> albumItems = [
      Album('assets/album cover/Layer 922.png', 'Last Love', 'Elvis Johnson'),
      Album('assets/album cover/Layer 942.png', 'Hostages', 'Peter Willy'),
      Album('assets/album cover/Layer 943.png', 'Blood Warmer',
          'Elvis Elvis Johnson'),
      Album('assets/album cover/Layer 943ee.png', 'Shy Bird Album',
          'Limova George'),
      Album('assets/album cover/Layer 1097.jpg', 'Last Call', 'Elvina Rose'),
      Album('assets/album cover/Layer 943.png', 'Blood Warmer',
          'Elvis Elvis Johnson'),
      Album('assets/album cover/Layer 943ee.png', 'Shy Bird Album',
          'Limova George'),
      Album('assets/album cover/Layer 1097.jpg', 'Last Call', 'Elvina Rose'),
    ];
    return FadedSlideAnimation(
      ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: albumItems.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, CollectionRoutes.album),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: index == 0 ? 30.0 : 0.0,
                        bottom: 15,
                        left: 15,
                        right: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Stack(
                              children: [
                                Image.asset('assets/album cover/album bg.png'),
                                Image.asset(
                                  albumItems[index].image,
                                  width: 80,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: albumItems[index].title + '\n',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(height: 1.5)),
                          TextSpan(
                              text: albumItems[index].subtitle,
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
          ),
        ],
      ),
      beginOffset: Offset(0, 0.3),
      endOffset: Offset(0, 0),
      slideCurve: Curves.linearToEaseOut,
    );
  }
}
