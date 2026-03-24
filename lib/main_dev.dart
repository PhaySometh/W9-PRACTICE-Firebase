import 'package:provider/provider.dart';
import 'package:week9_practice_firebase/data/repositories/artists/artist_repository.dart';
import 'package:week9_practice_firebase/data/repositories/artists/artist_repository_firebase.dart';
import 'package:week9_practice_firebase/data/services/music_service.dart';

import 'data/repositories/songs/song_repository_firebase.dart';
import 'main_common.dart';
import 'data/repositories/settings/app_settings_repository_mock.dart';
import 'data/repositories/songs/song_repository.dart';
import 'ui/states/player_state.dart';
import 'ui/states/settings_state.dart';

/// Configure provider dependencies for dev environment
List<InheritedProvider> get devProviders {
  final appSettingsRepository = AppSettingsRepositoryMock();

  return [

    // 1 - Inject the song repository
    Provider<SongRepository>(create: (_) => SongRepositoryFirebase()),
    
    // W9 - 02
    Provider<ArtistRepository>(create: (_) => AritistRepositoryFirebase()),
    
    // W9 - 03
    Provider<MusicService>(
      create: (context) => MusicService(
        songRepository: context.read<SongRepository>(), 
        artistRepository: context.read<ArtistRepository>(),
      ),
    ),

    // 2 - Inject the player state
    ChangeNotifierProvider<PlayerState>(create: (_) => PlayerState()),

    // 3 - Inject the  app setting state
    ChangeNotifierProvider<AppSettingsState>(
      create: (_) => AppSettingsState(repository: appSettingsRepository),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}