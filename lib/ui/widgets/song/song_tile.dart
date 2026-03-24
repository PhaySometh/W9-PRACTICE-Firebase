import 'package:flutter/material.dart';
import 'package:week9_practice_firebase/model/songs/song_detail.dart';

import '../../../model/songs/song.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.songDetail,
    required this.isPlaying,
    required this.onTap,
  });

  final SongDetail songDetail;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: ListTile(
          onTap: onTap,
          title: Text(songDetail.song.title),
          subtitle: Text('${songDetail.song.duration.inMinutes} mins ${songDetail.artist.name} - ${songDetail.artist.genre}'),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(songDetail.song.imageUrl),
          ),
          trailing: Text(
            isPlaying ? "Playing" : "",
            style: TextStyle(color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
