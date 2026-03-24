import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week9_practice_firebase/data/repositories/artists/artist_repository.dart';
import 'package:week9_practice_firebase/ui/screens/artists/view_model/artists_view_model.dart';
import 'package:week9_practice_firebase/ui/screens/artists/widgets/artists_content.dart';
import '../../states/player_state.dart';

class ArtistsScreen extends StatelessWidget {
  const ArtistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ArtistsViewModel(
        playerState: context.read<PlayerState>(),
        artistRepository: context.read<ArtistRepository>(),
      ),
      child: ArtistsContent(),
    );
  }
}
