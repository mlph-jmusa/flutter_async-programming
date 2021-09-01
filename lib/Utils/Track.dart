// ignore_for_file: file_names

// * Model for track fom Shazam
class Track {
  String key;
  String title;
  String subtitle;
  Images images;

  Track(this.key, this.title, this.subtitle, this.images);

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(json['key'], json['title'], json['subtitle'],
        Images.fromJson(json['images']));
  }
}

// * Model for Images inside Track
class Images {
  String background;

  Images(this.background);

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(json['background']);
  }
}
