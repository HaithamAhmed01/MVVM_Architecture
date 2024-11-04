import 'package:flutter/material.dart';
import 'package:test/core/api/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'langauge_manager.dart';

const String prefsKeyLang = "prefsKeyLang";
const String prefsKeyOnBoardingScreenView = "prefsKeyOnBoardingScreenView";
const String prefsKeyIsUserLogin = "prefsKeyIsUserLogin";
const String prefsKeyUserToken = "prefsKeyUserToken";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  // language

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefsKeyLang);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.ARABIC.getValue();
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      // set english
      _sharedPreferences.setString(
          prefsKeyLang, LanguageType.ENGLISH.getValue());
    } else {
      // set arabic
      _sharedPreferences.setString(
          prefsKeyLang, LanguageType.ARABIC.getValue());
    }
  }

  Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }

  // on boarding

  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(prefsKeyOnBoardingScreenView, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(prefsKeyOnBoardingScreenView) ?? false;
  }

// //login

  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(prefsKeyIsUserLogin, true);
  }

  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(prefsKeyUserToken, token);
  }

  Future<String> getUserToken() async {
    EndPoints.token = _sharedPreferences.getString(prefsKeyUserToken) ?? '';
    return EndPoints.token;
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefsKeyIsUserLogin) ?? false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(prefsKeyIsUserLogin);
    _sharedPreferences.remove(prefsKeyUserToken);
  }
}
