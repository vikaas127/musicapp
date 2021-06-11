class AlbumPage {
  String albumId;
  String albumName;
  String albumImage;
  int likeCount;
  int isLiked;
  List<MusicList> musicList;

  AlbumPage(
      {this.albumId,
        this.albumName,
        this.albumImage,
        this.likeCount,
        this.isLiked,
        this.musicList});

  AlbumPage.fromJson(Map<String, dynamic> json) {
    albumId = json['album_id'];
    albumName = json['album_name'];
    albumImage = json['album_image'];
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
    data['album_id'] = this.albumId;
    data['album_name'] = this.albumName;
    data['album_image'] = this.albumImage;
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
  String categoryName;
  String albumName;
  String movieName;
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
        this.categoryName,
        this.albumName,
        this.movieName,
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
    categoryName = json['category_name'];
    albumName = json['album_name'];
    movieName = json['movie_name'];
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
    data['category_name'] = this.categoryName;
    data['album_name'] = this.albumName;
    data['movie_name'] = this.movieName;
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
