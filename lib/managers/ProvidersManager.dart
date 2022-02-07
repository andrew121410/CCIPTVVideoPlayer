import 'dart:collection';

import 'package:m3u/m3u.dart';
import 'package:http/http.dart' as http;
import 'package:cc_iptv_video_player/objects/Provider.dart';
import 'package:cc_iptv_video_player/objects/ProviderDetails.dart';

class ProvidersManager {
  static Map<String, Provider> providers = HashMap<String, Provider>();

  static Future<List<M3uGenericEntry>> getM3UFromURL(
      ProviderDetails providerDetails) async {
    String theUrl = providerDetails.url +
        "/get.php?username=" +
        providerDetails.username +
        "&password=" +
        providerDetails.password +
        "&type=m3u_plus";

    final response = await http.get(Uri.parse(theUrl));
    final m3u = await M3uParser.parse(response.body);
    return m3u;
  }
}
