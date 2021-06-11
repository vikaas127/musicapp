class ArtistPage {
  String artistId;
  String artistName;
  String artistImage;
  int likeCount;
  int isLiked;
  List<MusicList> musicList;

  ArtistPage(
      {this.artistId,
        this.artistName,
        this.artistImage,
        this.likeCount,
        this.isLiked,
        this.musicList});

  ArtistPage.fromJson(Map<String, dynamic> json) {
    artistId = json['artist_id'];
    artistName = json['artist_name'];
    artistImage = json['artist_image'];
    likeCount = json['like_count'];
    isLiked = json['is_liked'];
    if (json['music_list'] != null) {
      musicList = new List<MusicList>();
      json['music_list'].forEach((v) {
        musicList.add(new MusicList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artist_id'] = this.artistId;
    data['artist_name'] = this.artistName;
    data['artist_image'] = this.artistImage;
    data['like_count'] = this.likeCount;
    data['is_liked'] = this.isLiked;
    if (this.musicList != null) {
      data['music_list'] = this.musicList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MusicList {
  String musicId;
  String artistId;
  String albumId;
  String categoryId;
  String musicTitle;
  String musicImage;
  String musicDuration;
  String categoryName;
  String albumName;
  int isLiked;
  int isInPlaylist;
  int likeCount;
  List<Artists> artists;

  MusicList(
      {this.musicId,
        this.artistId,
        this.albumId,
        this.categoryId,
        this.musicTitle,
        this.musicImage,
        this.musicDuration,
        this.categoryName,
        this.albumName,
        this.isLiked,
        this.isInPlaylist,
        this.likeCount,
        this.artists});

  MusicList.fromJson(Map<String, dynamic> json) {
    musicId = json['music_id'];
    artistId = json['artist_id'];
    albumId = json['album_id'];
    categoryId = json['category_id'];
    musicTitle = json['music_title'];
    musicImage = json['music_image'];
    musicDuration = json['music_duration'];
    categoryName = json['category_name'];
    albumName = json['album_name'];
    isLiked = json['is_liked'];
    isInPlaylist = json['is_in_playlist'];
    likeCount = json['like_count'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['music_id'] = this.musicId;
    data['artist_id'] = this.artistId;
    data['album_id'] = this.albumId;
    data['category_id'] = this.categoryId;
    data['music_title'] = this.musicTitle;
    data['music_image'] = this.musicImage;
    data['music_duration'] = this.musicDuration;
    data['category_name'] = this.categoryName;
    data['album_name'] = this.albumName;
    data['is_liked'] = this.isLiked;
    data['is_in_playlist'] = this.isInPlaylist;
    data['like_count'] = this.likeCount;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Artists {
  String artistId;
  String artistName;

  Artists({this.artistId, this.artistName});

  Artists.fromJson(Map<String, dynamic> json) {
    artistId = json['artist_id'];
    artistName = json['artist_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artist_id'] = this.artistId;
    data['artist_name'] = this.artistName;
    return data;
  }
}
