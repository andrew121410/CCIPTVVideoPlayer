import 'package:cc_iptv_video_player/objects/Provider.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils/ProvidersUtils.dart';

part 'ProviderDetails.g.dart';

// @JsonSerializable(explicitToJson: true)
@JsonSerializable()
class ProviderDetails {
  String prefix;
  String url;
  String username;
  String password;

  ProviderDetails(this.prefix, this.url, this.username, this.password);

  Provider getProvider() {
    return ProvidersUtils.providers.putIfAbsent(this.prefix.toLowerCase(), () => Provider(this));
  }

  factory ProviderDetails.fromJson(Map<String, dynamic> data) => _$ProviderDetailsFromJson(data);
  Map<String, dynamic> toJson () => _$ProviderDetailsToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProviderDetails &&
          runtimeType == other.runtimeType &&
          prefix == other.prefix &&
          url == other.url &&
          username == other.username &&
          password == other.password;

  @override
  int get hashCode =>
      prefix.hashCode ^ url.hashCode ^ username.hashCode ^ password.hashCode;
}