import 'package:week9_practice_firebase/model/artists/artist.dart';


class ArtistDto {
  static const String name = 'name';
  static const String genre = 'genre';
  static const String imageUrl = 'imageUrl';

  static Artist fromJson(String id, Map<String, dynamic> json) {
    assert(json[name] is String);
    assert(json[genre] is String);
    assert(json[imageUrl] is String);

    return Artist(
      id: id,
      name: json[name],
      genre: json[genre],
      imageUrl: json[imageUrl],
    );
  }

  /// Convert Song to JSON
  Map<String, dynamic> toJson(Artist artist) {
    return {
      name: artist.name,
      genre: artist.genre,
      imageUrl: artist.imageUrl,
    };
  }
}
