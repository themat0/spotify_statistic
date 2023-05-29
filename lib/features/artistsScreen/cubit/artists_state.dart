part of 'artists_cubit.dart';

@immutable
abstract class ArtistsState {
  final TimeInterval timeInterval;

  const ArtistsState(this.timeInterval);
}

class ArtistsInitialState extends ArtistsState {
  const ArtistsInitialState(super.timeInterval);
}

class ArtistsLoadedState extends ArtistsState {
  final List<ArtistObject> artists;

  const ArtistsLoadedState(super.timeInterval, this.artists);
}