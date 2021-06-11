import 'package:flutter/material.dart';
import 'package:musicvic/Auth/SignUp/UI/signup_ui.dart';
import 'package:musicvic/BottomNavigation/MyCollection/MyCollectionPage/artist_songs.dart';
import 'package:musicvic/BottomNavigation/MyCollection/playlist_songs.dart';
import 'package:musicvic/BottomNavigation/bottom_navigation.dart';
import 'package:musicvic/BottomNavigation/Home/home_page.dart';
import 'package:musicvic/Pages/music_language.dart';
import 'package:musicvic/Payment/payment_failed.dart';
import 'package:musicvic/BottomNavigation/Radio/radio_play.dart';
import 'package:musicvic/Settings/settings.dart';
import 'package:musicvic/Pages/song_play.dart';
import 'package:musicvic/Payment/subscribe_page.dart';
import 'package:musicvic/Payment/subscribed_page.dart';

class PageRoutes {
  static const String signUpPage = 'sign_up_page';
  static const String chooseMusicLanguage = 'choose_music_language';
  static const String homePage = 'home_page';
  static const String bottomNavigation = 'bottom_navigation';
  static const String playRadio = 'play_radio_page';
  static const String playListSongs = 'play_list_song';
  static const String playFullSong = 'play_full_song';
  static const String albumSongs = 'album_song';
  static const String settingsPage = 'settings_page';
  static const String subscriptionPage = 'subscription_page';
  static const String subscribedPage = 'subscribed_page';
  static const String paymentFailed = 'payment_failed';
  static const String artistSongs = 'artist_songs';

  Map<String, WidgetBuilder> routes() {
    return {
      signUpPage: (context) => SignUpUI(),
      chooseMusicLanguage: (context) => ChooseMusicLanguage(),
      homePage: (context) => HomeBody(),
      bottomNavigation: (context) => BottomNavigation(),
      playRadio: (context) => PlayRadioPage(),
      playListSongs: (context) => PlayListSongs(),
      artistSongs: (context) => ArtistSongs(),
      playFullSong: (context) => SongPlayPage(),
      settingsPage: (context) => SettingsPage(),
      subscriptionPage: (context) => SubscribePage(),
      subscribedPage: (context) => SubscribedPage(),
      paymentFailed: (context) => PaymentFailedPage(),
    };
  }
}
