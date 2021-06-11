class Musicplayer {
  String musicId;
  String type;
  String musicTitle;
  String albumId;
  String artistId;
  String lyricistId;
  String musicDirectorId;
  String categoryId;
  String musicFile;
  String musicImage;
  String musicDuration;
  String isPaid;
  int isInPlaylist;
  String lyrics;
  int likeCount;
  List<Artists> artists;
  String albumName;
  String categoryName;
  int isLiked;
  List<Playlist> playlist;

  Musicplayer(
      {this.musicId,
        this.type,
        this.musicTitle,
        this.albumId,
        this.artistId,
        this.lyricistId,
        this.musicDirectorId,
        this.categoryId,
        this.musicFile,
        this.musicImage,
        this.musicDuration,
        this.isPaid,
        this.isInPlaylist,
        this.lyrics,
        this.likeCount,
        this.artists,
        this.albumName,
        this.categoryName,
        this.isLiked,
        this.playlist});

  Musicplayer.fromJson(Map<String, dynamic> json) {
    musicId = json['music_id'];
    type = json['type'];
    musicTitle = json['music_title'];
    albumId = json['album_id'];
    artistId = json['artist_id'];
    lyricistId = json['lyricist_id'];
    musicDirectorId = json['music_director_id'];
    categoryId = json['category_id'];
    musicFile = json['music_file'];
    musicImage = json['music_image'];
    musicDuration = json['music_duration'];
    isPaid = json['is_paid'];
    isInPlaylist = json['is_in_playlist'];
    lyrics = json['lyrics'];
    likeCount = json['like_count'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    albumName = json['album_name'];
    categoryName = json['category_name'];
    isLiked = json['is_liked'];
    if (json['playlist'] != null) {
      playlist = new List<Playlist>();
      json['playlist'].forEach((v) {
        playlist.add(new Playlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['music_id'] = this.musicId;
    data['type'] = this.type;
    data['music_title'] = this.musicTitle;
    data['album_id'] = this.albumId;
    data['artist_id'] = this.artistId;
    data['lyricist_id'] = this.lyricistId;
    data['music_director_id'] = this.musicDirectorId;
    data['category_id'] = this.categoryId;
    data['music_file'] = this.musicFile;
    data['music_image'] = this.musicImage;
    data['music_duration'] = this.musicDuration;
    data['is_paid'] = this.isPaid;
    data['is_in_playlist'] = this.isInPlaylist;
    data['lyrics'] = this.lyrics;
    data['like_count'] = this.likeCount;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['album_name'] = this.albumName;
    data['category_name'] = this.categoryName;
    data['is_liked'] = this.isLiked;
    if (this.playlist != null) {
      data['playlist'] = this.playlist.map((v) => v.toJson()).toList();
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

class Playlist {
  String musicId;
  String type;
  String musicTitle;
  String albumId;
  String artistId;
  String lyricistId;
  String musicImage;
  String isPaid;

  Playlist(
      {this.musicId,
        this.type,
        this.musicTitle,
        this.albumId,
        this.artistId,
        this.lyricistId,
        this.musicImage,
        this.isPaid});

  Playlist.fromJson(Map<String, dynamic> json) {
    musicId = json['music_id'];
    type = json['type'];
    musicTitle = json['music_title'];
    albumId = json['album_id'];
    artistId = json['artist_id'];
    lyricistId = json['lyricist_id'];
    musicImage = json['music_image'];
    isPaid = json['is_paid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['music_id'] = this.musicId;
    data['type'] = this.type;
    data['music_title'] = this.musicTitle;
    data['album_id'] = this.albumId;
    data['artist_id'] = this.artistId;
    data['lyricist_id'] = this.lyricistId;
    data['music_image'] = this.musicImage;
    data['is_paid'] = this.isPaid;
    return data;
  }
}
