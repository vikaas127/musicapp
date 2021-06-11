class Audio {
  final String image;
  final String title;
  final String genre;
  final String language;
  final int noOfEpisodes;
  final int noOfSeasons;

  Audio({
    this.image,
    this.title,
    this.genre,
    this.language,
    this.noOfEpisodes,
    this.noOfSeasons,
  });
}

class AudioClip {
  final String thumbnail;
  final String time;

  AudioClip(this.thumbnail, this.time);
}
