class Music {
  String musicId;
  String type;
  String musicTitle;
  String musicImage;
  String isPaid;

  Music(
      {this.musicId, this.type, this.musicTitle, this.musicImage, this.isPaid});

  Music.fromJson(Map<String, dynamic> json) {
    musicId = json['music_id'];
    type = json['type'];
    musicTitle = json['music_title'];
    musicImage = json['music_image'];
    isPaid = json['is_paid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['music_id'] = this.musicId;
    data['type'] = this.type;
    data['music_title'] = this.musicTitle;
    data['music_image'] = this.musicImage;
    data['is_paid'] = this.isPaid;
    return data;
  }
}
