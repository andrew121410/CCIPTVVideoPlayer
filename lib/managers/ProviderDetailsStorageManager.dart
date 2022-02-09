import 'dart:convert';

import 'package:cc_iptv_video_player/objects/ProviderDetails.dart';
import 'package:cc_iptv_video_player/utils/ProvidersUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderDetailsStorageManager {

  static bool dataLoaded = false;

  static Future<bool> loadAll() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? rawProviders = preferences.getStringList("providers");
    if (rawProviders == null || rawProviders.isEmpty) {
      dataLoaded = true;
      return true;
    }
    for (var value in rawProviders) {
      ProviderDetails providerDetails = ProviderDetails.fromJson(jsonDecode(value));
      ProvidersUtils.addProviderDetails(providerDetails);
    }
    dataLoaded = true;
    print("ProviderDetailsStorageManager has loaded all ProviderDetails!");
    return true;
  }

  static Future<void> saveAll() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> jsonStrings = [];
    for (var value in ProvidersUtils.providersDetailsMap.values) {
      jsonStrings.add(jsonEncode(value.toJson()));
    }
    preferences.setStringList("providers", jsonStrings);
    print("ProviderDetailsStorageManager has saved all ProviderDetails!");
    return Future.value("Saved all providers!");
  }

  static Future<void> removeAll() async {
    print("Removing all providers and deleting from the shared preferences.");
    ProvidersUtils.providersDetailsMap.removeWhere((key, value) => true);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
