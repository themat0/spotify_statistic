import 'package:spotify_statistic/core/helpers/safe_response.dart';
import 'package:spotify_statistic/data/models/artist_object.dart';
import 'package:spotify_statistic/data/models/time_interval.dart';
import 'package:spotify_statistic/data/models/track_object.dart';
import 'package:spotify_statistic/data/models/user_object.dart';
import 'package:spotify_statistic/data/spotify_api_service.dart';

class SpotifyRepository {
  SpotifyRepository(this._apiService);

  final SpotifyApiService _apiService;

  Future<SafeResponse<String>> getAccessToken() => fetchSafety(() async => await _apiService.getAccessToken());

  Future<SafeResponse<List<ArtistObject>>> getTopArtists(TimeInterval timeInterval) =>
      fetchSafety(() async => await _apiService.getTopArtists(timeInterval));

  Future<SafeResponse<List<TrackObject>>> getTopTracks(TimeInterval timeInterval) =>
      fetchSafety(() async => await _apiService.getTopTracks(timeInterval));

  Future<SafeResponse<UserObject>> getUserInfo() => fetchSafety(() async => await _apiService.getUserInfo());
}
