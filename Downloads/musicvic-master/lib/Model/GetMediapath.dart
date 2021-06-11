class Getmediapath {
  String audioUrl;
  String videoUrl;
  String musicImageUrl;
  String albumImageUrl;
  String artistImageUrl;
  String bannerImageUrl;

  Getmediapath({
    this.audioUrl,
    this.videoUrl,
    this.musicImageUrl,
    this.albumImageUrl,
    this.artistImageUrl,
    this.bannerImageUrl
  });

  Getmediapath.fromJson(Map<String, dynamic> json) {
    audioUrl = json['audio_url'];
    videoUrl = json['video_url'];
    musicImageUrl = json['music_image_url'];
    albumImageUrl = json['album_image_url'];
    artistImageUrl = json['artist_image_url'];
    bannerImageUrl = json['banner_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['audio_url'] = this.audioUrl;
    data['video_url'] = this.videoUrl;
    data['music_image_url'] = this.musicImageUrl;
    data['album_image_url'] = this.albumImageUrl;
    data['artist_image_url'] = this.artistImageUrl;
    data['banner_image_url'] = this.bannerImageUrl;
    return data;
  }
}
