import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:musicvic/Locale/locale.dart';

class AddNewArtist extends StatefulWidget {
  @override
  _AddNewArtistState createState() => _AddNewArtistState();
}

class ArtistInfo {
  String name;
  String image;
  bool isSelected;

  ArtistInfo(this.name, this.image, this.isSelected);
}

class _AddNewArtistState extends State<AddNewArtist> {
  List<ArtistInfo> artistList = [
    ArtistInfo('Abd Resol', 'assets/Avatars/Change pic copy.png', true),
    ArtistInfo('Adams Terena', 'assets/Avatars/Layer 1174.png', true),
    ArtistInfo('Afro Jacks', 'assets/Avatars/Layer 1169.png', false),
    ArtistInfo('Aks William', 'assets/Avatars/Layer 1169-1.png', true),
    ArtistInfo('Bohem Hesion', 'assets/Avatars/Layer 1170.png', false),
    ArtistInfo('Bumlo Pajero', 'assets/Avatars/Layer 1171.png', true),
    ArtistInfo('Abd Resol', 'assets/Avatars/Change pic copy.png', false),
    ArtistInfo('Adams Terena', 'assets/Avatars/Layer 1174.png', false),
    ArtistInfo('Afro Jacks', 'assets/Avatars/Layer 1169.png', false),
    ArtistInfo('Aks Wiliam', 'assets/Avatars/Layer 1169-1.png', false),
    ArtistInfo('Bohem Hesion', 'assets/Avatars/Layer 1170.png', true),
    ArtistInfo('Bumlo Pajero', 'assets/Avatars/Layer 1171.png', false),
    ArtistInfo('Abd Resol', 'assets/Avatars/Change pic copy.png', false),
    ArtistInfo('Adams Terena', 'assets/Avatars/Layer 1174.png', false),
    ArtistInfo('Afro Jacks', 'assets/Avatars/Layer 1169.png', false),
    ArtistInfo('Aks Wiliam', 'assets/Avatars/Layer 1169-1.png', false),
    ArtistInfo('Bohem Hesion', 'assets/Avatars/Layer 1170.png', true),
    ArtistInfo('Bumlo Pajero', 'assets/Avatars/Layer 1171.png', false),
  ];
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.chooseArtist,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 12),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(locale.done,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1),
            ),
          ),
        ],
      ),
      body: FadedSlideAnimation(
        GridView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 130),
            itemCount: artistList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        artistList[index].isSelected = true;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(artistList[index].image),
                              )),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          artistList[index].name,
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: artistList[index].isSelected
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).highlightColor,
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  artistList[index].isSelected
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              artistList[index].isSelected = false;
                            });
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.transparent,
                                    Theme.of(context).primaryColor
                                  ]),
                            ),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Icon(Icons.check),
                                )),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              );
            }),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
