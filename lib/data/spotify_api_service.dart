import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:spotify_statistic/core/helpers/rest_api_exception.dart';
import 'package:spotify_statistic/data/models/artist_object.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:spotify_statistic/data/models/time_interval.dart';
import 'package:spotify_statistic/data/models/user_object.dart';
import 'package:spotify_statistic/data/token_repository.dart';

import 'models/track_object.dart';

class SpotifyApiService {
  SpotifyApiService(this._tokenRepository);

  final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 6,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );
  final TokenRepository _tokenRepository;

  Future<String> getAccessToken() async => await SpotifySdk.getAccessToken(
        clientId: dotenv.env['SPOTIFY_CLIENT_ID'] ?? '',
        redirectUrl: dotenv.env['SPOTIFY_REDIRECT_URL'] ?? '',
        scope: "user-top-read,user-read-private",
      );

  Future<List<ArtistObject>> getTopArtists(TimeInterval timeInterval) async {
    final String? accessToken = await _tokenRepository.getToken();
    final String url =
        "https://api.spotify.com/v1/me/top/artists?time_range=${timeInterval.apiName}";
    return http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    }).then((response) {
      logger.i(
          "Url: ${response.request?.url.toString()} \nStatus code: ${response.statusCode}\nbody: ${response.body}");
      if (response.statusCode != 200) {
        throw RestApiException(
            message: response.body, statusCode: response.statusCode);
      }
      final List<dynamic> artists = json.decode(response.body)['items'];
      return artists.map((e) => ArtistObject.fromJson(e)).toList();
    });
  }

  Future<List<TrackObject>> getTopTracks(TimeInterval timeInterval) async {
    final String? accessToken = await _tokenRepository.getToken();
    final String url =
        "https://api.spotify.com/v1/me/top/tracks?time_range=${timeInterval.apiName}";
    return http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    }).then((response) {
      logger.i(
          "Url: ${response.request?.url.toString()} \nStatus code: ${response.statusCode}\nbody: ${response.body}");
      if (response.statusCode != 200) {
        throw RestApiException(
            message: response.body, statusCode: response.statusCode);
      }
      final List<dynamic> tracks = json.decode(response.body)['items'];
      return tracks.map((e) => TrackObject.fromJson(e)).toList();
    });
  }

  Future<UserObject> getUserInfo() async {
    final String? accessToken = await _tokenRepository.getToken();
    const String url = "https://api.spotify.com/v1/me";
    return http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    }).then((response) {
      logger.i(
          "Url: ${response.request?.url.toString()} \nStatus code: ${response.statusCode}\nbody: ${response.body}");
      if (response.statusCode != 200) {
        throw RestApiException(
            message: response.body, statusCode: response.statusCode);
      }
      return UserObject.fromJson(json.decode(response.body));
    });
  }
}
