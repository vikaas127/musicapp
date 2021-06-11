import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:musicvic/Auth/login_navigator.dart';
import 'package:musicvic/Components/continue_button.dart';
import 'package:musicvic/Locale/locale.dart';
import 'package:musicvic/Theme/colors.dart';

class ChooseMusicLanguage extends StatefulWidget {
  @override
  _ChooseMusicLanguageState createState() => _ChooseMusicLanguageState();
}

class _ChooseMusicLanguageState extends State<ChooseMusicLanguage> {
  List<bool> isLanguageSelected = [
    true,
    false,
    false,
    true,
    false,
    false,
    false,
    false,
    true,
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    List<String> languageList = [
      'English',
      'Spanish',
      'Chinese',
      'French',
      'Tagalog',
      'Vietnamese',
      'Korean',
      'German',
      'Arabic',
      'Hindi',
      'Russian',
      'Italian'
    ];
    var locale = AppLocalizations.of(context);
    return Scaffold(
      // backgroundColor: Theme.of(context).disabledColor,
      appBar: AppBar(
        title: Text(
          locale.musicLanguage,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: FadedSlideAnimation(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 30),
                  // shrinkWrap: true,
                  itemCount: isLanguageSelected.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 2.3,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isLanguageSelected[index] =
                              !isLanguageSelected[index];
                        });
                      },
                      child: FadedScaleAnimation(
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: isLanguageSelected[index]
                                ? Theme.of(context).highlightColor
                                : languageDisabledColor,
                          ),
                          child: Center(
                              child: Text(
                            languageList[index],
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(
                                    color: isLanguageSelected[index]
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context).highlightColor),
                          )),
                        ),
                      ),
                    );
                  }),
            ),
            // Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
              child: ContinueButton(
                () {
                  Navigator.pushNamed(context, LoginRoutes.chooseArtists);
                },
                text: locale.next,
              ),
            )
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
