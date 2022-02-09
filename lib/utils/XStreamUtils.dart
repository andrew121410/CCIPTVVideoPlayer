import 'dart:convert';

import 'package:cc_iptv_video_player/objects/Provider.dart';
import 'package:cc_iptv_video_player/objects/ProviderDetails.dart';
import 'package:cc_iptv_video_player/xstreamobjects/XChannel.dart';
import 'package:http/http.dart' as http;

import '../xstreamobjects/XCategory.dart';

class XStreamUtils {

  static String _getURL(ProviderDetails providerDetails, String action){
    return providerDetails.url +
        "/player_api.php?username=" +
        providerDetails.username +
        "&password=" +
        providerDetails.password +
        "&action="+action;
  }

  static Future<List<XCategory>> getLiveCategories(Provider provider) async {
    ProviderDetails providerDetails = provider.getProviderDetails;
    final response = await http.get(Uri.parse(_getURL(providerDetails, "get_live_categories")));
    return parseCategories(response.body);
  }

  static Future<List<XChannel>> getLiveCategoryChannels(Provider provider, String id) async{
    ProviderDetails providerDetails = provider.getProviderDetails;
    final response = await http.get(Uri.parse(_getURL(providerDetails, "get_live_streams&category_id="+id)));
    List<XChannel> xChannels = (jsonDecode(response.body) as List).map((i) => XChannel.fromJson(i)).toList();
    return xChannels;
  }

  static List<XCategory> parseCategories(String json) {
    List<XCategory> xCategories =
        (jsonDecode(json) as List).map((i) => XCategory.fromJson(i)).toList();
    return xCategories;
  }
}
