

import 'dart:convert';

import 'package:heybuddy/shared_preference/token_preference.dart';

TokenProfile? tokenProfille;

class TokenProfile {
  var token;

  TokenProfile.values({
    this.token,
  });

  TokenProfile.fromJson(String value) {
    token = value;
    print("dptokencheck22  $token");

    tokenPreference.setTokenPreferenceData(json.encode(value));
  }
}

