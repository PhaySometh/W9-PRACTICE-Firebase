import 'package:flutter/material.dart';
import 'package:week9_practice_firebase/data/services/music_service.dart';
import 'package:week9_practice_firebase/model/songs/song_detail.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';
import '../../../utils/async_value.dart';

class LibraryViewModel extends ChangeNotifier {
  final MusicService musicService;
  final PlayerState playerState;

  AsyncValue<List<SongDetail>> songDetailsValue = AsyncValue.loading();

  LibraryViewModel({required this.musicService, required this.playerState}) {
    playerState.addListener(notifyListeners);

    // init
    _init();
  }

  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    super.dispose();
  }

  void _init() async {
    fetchSong();
  }

  void fetchSong() async {
    // 1- Loading state
    songDetailsValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2- Fetch is successfull
      List<SongDetail> songDetail = await musicService.fetchSongDetails();
      songDetailsValue = AsyncValue.success(songDetail);
    } catch (e) {
      // 3- Fetch is unsucessfull
      songDetailsValue = AsyncValue.error(e);
    }
    notifyListeners();

  }

  bool isSongPlaying(Song song) => playerState.currentSong == song;

  void start(Song song) => playerState.start(song);
  void stop(Song song) => playerState.stop();
}
