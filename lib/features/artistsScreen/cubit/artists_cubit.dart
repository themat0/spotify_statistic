import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify_statistic/data/models/artist_object.dart';
import 'package:spotify_statistic/data/models/time_interval.dart';
import 'package:spotify_statistic/data/spotify_repository.dart';
import 'package:spotify_statistic/features/globalUi/cubit/global_ui_cubit.dart';

part 'artists_state.dart';

class ArtistsCubit extends Cubit<ArtistsState> {
  ArtistsCubit(this._spotifyRepository, this._globalUiCubit)
      : super(const ArtistsInitialState(TimeInterval.last4Weeks));

  final SpotifyRepository _spotifyRepository;
  final GlobalUiCubit _globalUiCubit;

  void changeTimeInterval(TimeInterval timeInterval) {
    emit(ArtistsInitialState(timeInterval));
    loadArtists();
  }

  void loadArtists() async {
    emit(ArtistsInitialState(state.timeInterval));
    final artists = await _spotifyRepository.getTopArtists(state.timeInterval);
    if (artists.isSuccessful) {
      emit(ArtistsLoadedState(state.timeInterval, artists.requiredData));
    } else {
      _globalUiCubit.showSnackBarError(artists.errorResponse);
    }
  }

  void init() {
    loadArtists();
  }
}
