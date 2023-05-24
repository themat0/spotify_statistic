part of 'tracks_cubit.dart';

@immutable
abstract class TracksState {
  final TimeInterval timeInterval;

  const TracksState(this.timeInterval);
}

class TracksInitialState extends TracksState {
  const TracksInitialState(super.timeInterval);
}

class TracksLoadedState extends TracksState {
  final List<TrackObject> tracks;

  const TracksLoadedState(super.timeInterval, this.tracks);
}