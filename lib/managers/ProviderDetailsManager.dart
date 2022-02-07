import 'dart:collection';
import 'dart:convert';

import 'package:cc_iptv_video_player/objects/ProviderDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderDetailsManager {
  static HashMap<String, ProviderDetails> providers =
      HashMap<String, ProviderDetails>();
  static bool dataLoaded = false;

  static void addProvider(ProviderDetails providerDetails) {
    providers.putIfAbsent(
        providerDetails.prefix.toLowerCase(), () => providerDetails);
  }

  static void removeProvider(String prefix) {
    providers.remove(prefix.toLowerCase());
  }

  static ProviderDetails? getProviderByPrefix(String prefix) {
    return providers[prefix.toLowerCase()];
  }

  static ProviderDetails? getProviderByURL(String url) {
    for (var value in providers.values) {
      if (value.url == url.toLowerCase()) {
        return value;
      }
    }
    return null;
  }

  static Future<bool> loadAll() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? rawProviders = preferences.getStringList("providers");
    if (rawProviders == null || rawProviders.isEmpty) {
      dataLoaded = true;
      return false;
    }
    for (var value in rawProviders) {
      ProviderDetails providerDetails =
          ProviderDetails.fromJson(jsonDecode(value));
      providers.putIfAbsent(
          providerDetails.prefix.toLowerCase(), () => providerDetails);
    }
    print("DONE LOADING UP PROVIDERS!!!");
    dataLoaded = true;
    return true;
  }

  static Future<void> saveAll() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> jsonStrings = [];
    for (var value in providers.values) {
      jsonStrings.add(jsonEncode(value.toJson()));
    }
    preferences.setStringList("providers", jsonStrings);
    print("SAVED ALL PROVIDERS!!");
    return Future.value("Saved all providers!");
  }

  void removeAll() async {
    print("Removing all providers and deleting from the shared preferences.");
    providers.removeWhere((key, value) => true);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
