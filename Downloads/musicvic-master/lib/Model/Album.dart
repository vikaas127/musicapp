class Album {
  String albumId;
  String albumName;
  String albumImage;
  int totalSongs;

  Album({this.albumId, this.albumName, this.albumImage, this.totalSongs});

  Album.fromJson(Map<String, dynamic> json) {
    albumId = json['album_id'];
    albumName = json['album_name'];
    albumImage = json['album_image'];
    totalSongs = json['total_songs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['album_id'] = this.albumId;
    data['album_name'] = this.albumName;
    data['album_image'] = this.albumImage;
    data['total_songs'] = this.totalSongs;
    return data;
  }
}
