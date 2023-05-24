class TrackObject {
  final String name;
  final String image;
  final int popularity;

  TrackObject({required this.name, required this.image, required this.popularity});

  factory TrackObject.fromJson(Map<String, dynamic> json) {
    return TrackObject(
      name: json['name'],
      image: json['album']['images'][0]['url'],
      popularity: json['popularity'],
    );
  }
}