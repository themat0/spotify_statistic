import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify_statistic/data/models/track_object.dart';

import '../../../data/models/time_interval.dart';
import '../../../data/spotify_repository.dart';
import '../../globalUi/cubit/global_ui_cubit.dart';

part 'tracks_state.dart';

class TracksCubit extends Cubit<TracksState> {
  TracksCubit(this._spotifyRepository, this._globalUiCubit)
      : super(const TracksInitialState(TimeInterval.last4Weeks));

  final SpotifyRepository _spotifyRepository;
  final GlobalUiCubit _globalUiCubit;

  void changeTimeInterval(TimeInterval timeInterval) {
    emit(TracksInitialState(timeInterval));
    loadTracks();
  }

  void loadTracks() async {

    emit(TracksInitialState(state.timeInterval));
    final tracks = await _spotifyRepository.getTopTracks(state.timeInterval);
    if (tracks.isSuccessful) {
      emit(TracksLoadedState(state.timeInterval, tracks.requiredData));
    } else {
      _globalUiCubit.showSnackBarError(tracks.errorResponse);
    }
  }

  void init() {
    loadTracks();
  }
}
