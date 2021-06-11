class Artist {
  String artistId;
  String artistName;
  String artistImage;

  Artist({this.artistId, this.artistName, this.artistImage});

  Artist.fromJson(Map<String, dynamic> json) {
    artistId = json['artist_id'];
    artistName = json['artist_name'];
    artistImage = json['artist_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artist_id'] = this.artistId;
    data['artist_name'] = this.artistName;
    data['artist_image'] = this.artistImage;
    return data;
  }
}
