import 'dart:collection';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:testingproject/objects/ProviderDetails.dart';

class ProviderDetailsManager {
  HashMap<String, ProviderDetails> providers =
      HashMap<String, ProviderDetails>();

  ProviderDetails addProvider(ProviderDetails providerDetails) {
    return this
        .providers
        .putIfAbsent(providerDetails.prefix.toLowerCase(), () => providerDetails);
  }

  ProviderDetails? getProviderByPrefix(String prefix) {
    return this.providers[prefix.toLowerCase()];
  }

  ProviderDetails? getProviderByURL(String url) {
    for (var value in this.providers.values) {
      if (value.url == url.toLowerCase()) {
        return value;
      }
    }
    return null;
  }

  void removeProvider(String prefix) {
    this.providers.remove(prefix.toLowerCase());
  }

  Future<bool> loadAll() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? rawProviders = preferences.getStringList("providers");
    if (rawProviders == null || rawProviders.isEmpty) return false;
    for (var value in rawProviders) {
      ProviderDetails providerDetails =
          ProviderDetails.fromJson(jsonDecode(value));
      this.providers.putIfAbsent(providerDetails.prefix.toLowerCase(), () => providerDetails);
    }
    print("DONE LOADING UP PROVIDERS!!!");
    return true;
  }

  void saveAll() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> jsonStrings = [];
    for (var value in this.providers.values) {
      jsonStrings.add(jsonEncode(value.toJson()));
    }
    if (jsonStrings.isEmpty) return;
    preferences.setStringList("providers", jsonStrings);
    print("SAVED ALL PROVIDERS!!");
  }

  void removeAll() async {
    print("Removing all providers and deleting from the shared preferences.");
    this.providers.removeWhere((key, value) => true);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
