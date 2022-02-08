import 'dart:convert';

import 'package:cc_iptv_video_player/objects/Provider.dart';
import 'package:cc_iptv_video_player/objects/ProviderDetails.dart';
import 'package:http/http.dart' as http;

import '../xstreamobjects/XCategory.dart';

class XStreamUtils {
  static Future<List<XCategory>> getLiveCategories(Provider provider) async {
    ProviderDetails providerDetails = provider.getProviderDetails;

    String theUrl = providerDetails.url +
        "/player_api.php?username=" +
        providerDetails.username +
        "&password=" +
        providerDetails.password +
        "&action=get_live_categories";

    final response = await http.get(Uri.parse(theUrl));
    return parseCategories(response.body);
  }

  static List<XCategory> parseCategories(String json) {
    List<XCategory> xCategories =
        (jsonDecode(json) as List).map((i) => XCategory.fromJson(i)).toList();
    return xCategories;
  }
}
