import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:musicvic/Components/entry_field.dart';
import 'package:musicvic/Locale/locale.dart';
import 'package:musicvic/Theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../language_cubit.dart';

class PreferenceTab extends StatefulWidget {
  @override
  _PreferenceTabState createState() => _PreferenceTabState();
}

class _PreferenceTabState extends State<PreferenceTab> {
  TextEditingController downloadsController = TextEditingController();
  TextEditingController qualityController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController logoutController = TextEditingController();

  LanguageCubit _languageCubit;

  @override
  void initState() {
    super.initState();
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
  }

  @override
  void dispose() {
    downloadsController.dispose();
    qualityController.dispose();
    languageController.dispose();
    logoutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    downloadsController.text = 'WiFi Only';
    qualityController.text = 'HD (High Definition)';
    languageController.text = locale.englishText;
    logoutController.text = locale.logout;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildEntryField(
            context: context,
            controller: qualityController,
            label: locale.audioQuality,
            upperPadding: 256.0,
            items: [
              PopupMenuItem(
                child: Text('HD (High Definition)'),
                value: 'HD (High Definition)',
              ),
              PopupMenuItem(
                child: Text('SD (Standard Definitiom)'),
                value: 'SD (Standard Definitiom)',
              ),
            ],
          ),
          buildEntryField(
            context: context,
            controller: languageController,
            label: locale.preferredAppLanguage,
            upperPadding: 320.0,
            items: [
              PopupMenuItem(
                child: Text(locale.englishText),
                value: locale.englishText,
              ),
              PopupMenuItem(
                child: Text(locale.arabicText),
                value: locale.arabicText,
              ),
              PopupMenuItem(
                child: Text(locale.portugueseText),
                value: locale.portugueseText,
              ),
              PopupMenuItem(
                child: Text(locale.frenchText),
                value: locale.frenchText,
              ),
              PopupMenuItem(
                child: Text(locale.spanishText),
                value: locale.spanishText,
              ),
              PopupMenuItem(
                child: Text(locale.indonesianText),
                value: locale.indonesianText,
              ),
            ],
          ),
          buildEntryField(
            context: context,
            controller: downloadsController,
            label: 'Downloads',
            upperPadding: 400.0,
            items: [
              PopupMenuItem(
                child: Text('WiFi Only'),
                value: 'WiFi Only',
              ),
              PopupMenuItem(
                child: Text('Mobile Data'),
                value: 'Mobile Data',
              ),
            ],
          ),
          EntryField(
            label: locale.youAreLoggedIn,
            controller: logoutController,
            readOnly: true,
            noBorder: true,
            onTap: () {
              Phoenix.rebirth(context);
            },
          ),
          Spacer(),
        ],
      ),
    );
  }

  Padding buildEntryField({
    BuildContext context,
    TextEditingController controller,
    String label,
    List<PopupMenuItem> items,
    double upperPadding,
    bool suffixIconEnabled = true,
    String initialValue,
  }) {
    var locale = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: EntryField(
        initialValue: initialValue ?? initialValue,
        controller: controller,
        label: label,
        readOnly: true,
        noBorder: true,
        suffixIcon: suffixIconEnabled
            ? Icon(
                Icons.keyboard_arrow_down,
                color: Theme.of(context).primaryColor,
              )
            : null,
        onTap: () async {
          var prefs = await SharedPreferences.getInstance();
          var result = await showMenu(
            color: textBackgroundColor,
            context: context,
            position: RelativeRect.fromLTRB(100.0, upperPadding, 30.0, 0.0),
            items: items,
          );
          if (result == null) {
            result = controller.text;
          }
          if (result == locale.englishText) {
            prefs.setString('locale', 'en');
            _languageCubit.selectEngLanguage();
          } else if (result == locale.arabicText) {
            prefs.setString('locale', 'ar');
            _languageCubit.selectArabicLanguage();
          } else if (result == locale.portugueseText) {
            prefs.setString('locale', 'pt');
            _languageCubit.selectPortugueseLanguage();
          } else if (result == locale.frenchText) {
            prefs.setString('locale', 'fr');
            _languageCubit.selectFrenchLanguage();
          } else if (result == locale.spanishText) {
            prefs.setString('locale', 'es');
            _languageCubit.selectSpanishLanguage();
          } else if (result == locale.indonesianText) {
            prefs.setString('locale', 'in');
            _languageCubit.selectIndonesianLanguage();
          }
          controller.text = result.toString();
        },
      ),
    );
  }
}
