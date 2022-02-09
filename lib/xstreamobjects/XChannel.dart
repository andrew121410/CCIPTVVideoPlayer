class XChannel {
  String _name;
  int _streamId;
  String _streamIcon;
  String _epgChannelId;
  int _tvArchive;
  int _tvArchiveDuration;

  XChannel(this._name, this._streamId, this._streamIcon, this._epgChannelId,
      this._tvArchive, this._tvArchiveDuration);

  int get tvArchiveDuration => _tvArchiveDuration;

  int get tvArchive => _tvArchive;

  String get epgChannelId => _epgChannelId;

  String get streamIcon => _streamIcon;

  int get streamId => _streamId;

  String get name => _name;

  factory XChannel.fromJson(Map<String, dynamic> data) {
    final name = data["name"] as String;
    final streamId = data["stream_id"] as int;
    final streamIcon = data['stream_icon'] as String;
    final epgChannelId = data['epg_channel_id'] as String;
    final tvArchive = data['tv_archive'] as int;
    final tvArchiveDuration = data['tv_archive_duration'] as int;
    return XChannel(name, streamId, streamIcon, epgChannelId, tvArchive, tvArchiveDuration);
  }
}