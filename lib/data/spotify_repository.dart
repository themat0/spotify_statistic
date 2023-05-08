import 'package:spotify_statistic/core/helpers/safe_response.dart';
import 'package:spotify_statistic/data/spotify_api_service.dart';

class SpotifyRepository {
  SpotifyRepository(this._apiService);

  final SpotifyApiService _apiService;

  Future<SafeResponse<String>> getAccessToken() async {
    return fetchSafety(() async => await _apiService.getAccessToken());
  }
}
