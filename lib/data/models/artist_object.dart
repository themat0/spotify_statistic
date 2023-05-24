class ArtistObject {
  final String name;
  final String image;
  final int popularity;

  ArtistObject({required this.name, required this.image, required this.popularity});

  factory ArtistObject.fromJson(Map<String, dynamic> json) {
    return ArtistObject(
      name: json['name'],
      image: json['images'][0]['url'],
      popularity: json['popularity'],
    );
  }
}