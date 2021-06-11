import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LanguageCubit extends Cubit<Locale> {
  final String locale;
  LanguageCubit(this.locale)
      : super(locale != null ? Locale(locale) : Locale('en'));

  void selectEngLanguage() {
    emit(Locale('en'));
  }

  void selectArabicLanguage() {
    emit(Locale('ar'));
  }

  void selectPortugueseLanguage() {
    emit(Locale('pt'));
  }

  void selectFrenchLanguage() {
    emit(Locale('fr'));
  }

  void selectIndonesianLanguage() {
    emit(Locale('id'));
  }

  void selectSpanishLanguage() {
    emit(Locale('es'));
  }
}
