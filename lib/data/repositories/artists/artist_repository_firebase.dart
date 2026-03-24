import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:week9_practice_firebase/data/dtos/artist_dto.dart';
import 'package:week9_practice_firebase/data/repositories/artists/artist_repository.dart';

import '../../../model/artists/artist.dart';

class AritistRepositoryFirebase extends ArtistRepository {
  final Uri artistsUri = Uri.https('w9-database-47252-default-rtdb.asia-southeast1.firebasedatabase.app', '/artists.json');

  @override
  Future<List<Artist>> fetchArtists() async {
    final http.Response response = await http.get(artistsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of Aritists
      Map<String, dynamic> artistJson = json.decode(response.body);
      return artistJson.entries
        .map((entry) => ArtistDto.fromJson(entry.key, entry.value))
        .toList();
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Artist?> fetchArtistById(String id) async {}
}
