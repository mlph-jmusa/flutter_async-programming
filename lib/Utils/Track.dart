// ignore_for_file: file_names

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

class Images {
  String background;

  Images(this.background);

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(json['background']);
  }
}
