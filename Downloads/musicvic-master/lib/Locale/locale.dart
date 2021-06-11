import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Languages/arabic.dart';
import 'Languages/english.dart';
import 'Languages/french.dart';
import 'Languages/indonesian.dart';
import 'Languages/portuguese.dart';
import 'Languages/spanish.dart';

// import 'Languages/arabic.dart';
// import 'Languages/french.dart';
// import 'Languages/indonesian.dart';
// import 'Languages/portuguese.dart';
// import 'Languages/spanish.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
    'pt': portuguese(),
    'fr': french(),
    'id': indonesian(),
    'es': spanish(),
  };

  String get signIn {
    return _localizedValues[locale.languageCode]['signIn'];
  }

  String get skip {
    return _localizedValues[locale.languageCode]['skip'];
  }

  String get selectCountry {
    return _localizedValues[locale.languageCode]['selectCountry'];
  }

  String get phoneNumber {
    return _localizedValues[locale.languageCode]['phoneNumber'];
  }
  String get orContinueWith {
    return _localizedValues[locale.languageCode]['orContinueWith'];
  }
  String get facebook {
    return _localizedValues[locale.languageCode]['facebook'];
  }
  String get google {
    return _localizedValues[locale.languageCode]['google'];
  }
  String get signUp {
    return _localizedValues[locale.languageCode]['signUp'];
  }
  String get fullName {
    return _localizedValues[locale.languageCode]['fullName'];
  }
  String get emailAddress {
    return _localizedValues[locale.languageCode]['emailAddress'];
  }
  String get password {
    return _localizedValues[locale.languageCode]['password'];
  }
  String get wellSendOTP {
    return _localizedValues[locale.languageCode]['wellSendOTP'];
  }

  String get verification {
    return _localizedValues[locale.languageCode]['verification'];
  }

  String get add6DigitPhoneNumber {
    return _localizedValues[locale.languageCode]['add6DigitPhoneNumber'];
  }

  String get enterVerificationCode {
    return _localizedValues[locale.languageCode]['enterVerificationCode'];
  }

  String get submit {
    return _localizedValues[locale.languageCode]['submit'];
  }

  String get recentlyPlayed {
    return _localizedValues[locale.languageCode]['recentlyPlayed'];
  }
  String get mostlyPlayed {
    return _localizedValues[locale.languageCode]['mostlyPlayed'];
  }
  String get moodPlaylist {
    return _localizedValues[locale.languageCode]['moodPlaylist'];
  }

  String get newlyLaunched {
    return _localizedValues[locale.languageCode]['newlyLaunched'];
  }

  String get playAll {
    return _localizedValues[locale.languageCode]['playAll'];
  }

  String get likeIt {
    return _localizedValues[locale.languageCode]['likeIt'];
  }

  String get remove {
    return _localizedValues[locale.languageCode]['remove'];
  }

  String get addToPlaylist {
    return _localizedValues[locale.languageCode]['addToPlaylist'];
  }

  String get playNext {
    return _localizedValues[locale.languageCode]['playNext'];
  }

  String get goToAlbum {
    return _localizedValues[locale.languageCode]['goToAlbum'];
  }

  String get viewArtist {
    return _localizedValues[locale.languageCode]['viewArtist'];
  }

  String get share {
    return _localizedValues[locale.languageCode]['share'];
  }

  String get followers {
    return _localizedValues[locale.languageCode]['followers'];
  }

  String get following {
    return _localizedValues[locale.languageCode]['following'];
  }

  String get addNewArtist {
    return _localizedValues[locale.languageCode]['addNewArtist'];
  }

  String get retroHits {
    return _localizedValues[locale.languageCode]['retroHits'];
  }

  String get songs {
    return _localizedValues[locale.languageCode]['songs'];
  }

  String get shufflePlay {
    return _localizedValues[locale.languageCode]['shufflePlay'];
  }

  String get radio {
    return _localizedValues[locale.languageCode]['radio'];
  }

  String get liveRadio {
    return _localizedValues[locale.languageCode]['liveRadio'];
  }

  String get artistRadio {
    return _localizedValues[locale.languageCode]['artistRadio'];
  }

  String get whatWouldYouLike {
    return _localizedValues[locale.languageCode]['whatWouldYouLike'];
  }

  String get searchSongs {
    return _localizedValues[locale.languageCode]['searchSongs'];
  }

  String get whichGenres {
    return _localizedValues[locale.languageCode]['whichGenres'];
  }

  String get recommendedForYou {
    return _localizedValues[locale.languageCode]['recommendedForYou'];
  }

  String get party {
    return _localizedValues[locale.languageCode]['party'];
  }

  String get romance {
    return _localizedValues[locale.languageCode]['romance'];
  }

  String get retro {
    return _localizedValues[locale.languageCode]['retro'];
  }

  String get rocking {
    return _localizedValues[locale.languageCode]['rocking'];
  }

  String get remix {
    return _localizedValues[locale.languageCode]['remix'];
  }

  String get chooseArtist {
    return _localizedValues[locale.languageCode]['chooseArtist'];
  }

  String get done {
    return _localizedValues[locale.languageCode]['done'];
  }

  String get next {
    return _localizedValues[locale.languageCode]['next'];
  }

  String get musicLanguage {
    return _localizedValues[locale.languageCode]['musicLanguage'];
  }

  String get oops {
    return _localizedValues[locale.languageCode]['oops'];
  }

  String get paymentFailed {
    return _localizedValues[locale.languageCode]['paymentFailed'];
  }

  String get somethingWentWrong {
    return _localizedValues[locale.languageCode]['somethingWentWrong'];
  }

  String get pleaseTryAgain {
    return _localizedValues[locale.languageCode]['pleaseTryAgain'];
  }

  String get similarRadioChannels {
    return _localizedValues[locale.languageCode]['similarRadioChannels'];
  }

  String get chartBuster {
    return _localizedValues[locale.languageCode]['chartBuster'];
  }

  String get listeners {
    return _localizedValues[locale.languageCode]['listeners'];
  }

  String get comingUpNext {
    return _localizedValues[locale.languageCode]['comingUpNext'];
  }

  String get subscribe {
    return _localizedValues[locale.languageCode]['subscribe'];
  }

  String get months {
    return _localizedValues[locale.languageCode]['months'];
  }

  String get starterPack {
    return _localizedValues[locale.languageCode]['starterPack'];
  }

  String get standardPack {
    return _localizedValues[locale.languageCode]['standardPack'];
  }

  String get superSaverPack {
    return _localizedValues[locale.languageCode]['superSaverPack'];
  }

  String get subscriptionAllows {
    return _localizedValues[locale.languageCode]['subscriptionAllows'];
  }

  String get feature1 {
    return _localizedValues[locale.languageCode]['feature1'];
  }

  String get feature2 {
    return _localizedValues[locale.languageCode]['feature2'];
  }

  String get feature3 {
    return _localizedValues[locale.languageCode]['feature3'];
  }

  String get feature4 {
    return _localizedValues[locale.languageCode]['feature4'];
  }

  String get subscribedNow {
    return _localizedValues[locale.languageCode]['subscribedNow'];
  }

  String get exploreNow {
    return _localizedValues[locale.languageCode]['exploreNow'];
  }

  String get continueText {
    return _localizedValues[locale.languageCode]['continueText'];
  }

  String get youAreSubscribed {
    return _localizedValues[locale.languageCode]['youAreSubscribed'];
  }

  String get upgradeTo {
    return _localizedValues[locale.languageCode]['upgradeTo'];
  }

  String get premium {
    return _localizedValues[locale.languageCode]['premium'];
  }

  String get preference {
    return _localizedValues[locale.languageCode]['preference'];
  }

  String get profile {
    return _localizedValues[locale.languageCode]['profile'];
  }

  String get settings {
    return _localizedValues[locale.languageCode]['settings'];
  }

  String get audioQuality {
    return _localizedValues[locale.languageCode]['audioQuality'];
  }

  String get preferredAppLanguage {
    return _localizedValues[locale.languageCode]['preferredAppLanguage'];
  }

  String get englishText {
    return _localizedValues[locale.languageCode]['englishText'];
  }

  String get arabicText {
    return _localizedValues[locale.languageCode]['arabicText'];
  }

  String get portugueseText {
    return _localizedValues[locale.languageCode]['portugueseText'];
  }

  String get frenchText {
    return _localizedValues[locale.languageCode]['frenchText'];
  }

  String get spanishText {
    return _localizedValues[locale.languageCode]['spanishText'];
  }

  String get indonesianText {
    return _localizedValues[locale.languageCode]['indonesianText'];
  }

  String get youAreLoggedIn {
    return _localizedValues[locale.languageCode]['youAreLoggedIn'];
  }

  String get logout {
    return _localizedValues[locale.languageCode]['logout'];
  }

  String get playlist {
    return _localizedValues[locale.languageCode]['playlist'];
  }

  String get album {
    return _localizedValues[locale.languageCode]['album'];
  }

  String get artist {
    return _localizedValues[locale.languageCode]['artist'];
  }

  String get myCollection {
    return _localizedValues[locale.languageCode]['myCollection'];
  }

  String get likedSongs {
    return _localizedValues[locale.languageCode]['likedSongs'];
  }

  String get hipHopper {
    return _localizedValues[locale.languageCode]['hipHopper'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'ar', 'id', 'pt', 'fr', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
