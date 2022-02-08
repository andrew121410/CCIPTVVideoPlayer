import 'dart:collection';

import 'package:cc_iptv_video_player/objects/Provider.dart';

import '../objects/ProviderDetails.dart';

class ProvidersUtils {
  static HashMap<String, ProviderDetails> providersDetailsMap = HashMap<String, ProviderDetails>();
  static Map<String, Provider> providers = HashMap<String, Provider>();

  static void addProviderDetails(ProviderDetails providerDetails) {
    providersDetailsMap.putIfAbsent(providerDetails.prefix.toLowerCase(), () => providerDetails);
  }

  static void removeProvider(String prefix) {
    providersDetailsMap.remove(prefix.toLowerCase());
    providers.remove(prefix.toLowerCase());
  }

  static ProviderDetails? getProviderDetailsByPrefix(String prefix) {
    return providersDetailsMap[prefix.toLowerCase()];
  }

  static ProviderDetails? getProviderDetailsByURL(String url) {
    for (var value in providersDetailsMap.values) {
      if (value.url == url.toLowerCase()) {
        return value;
      }
    }
    return null;
  }
}
