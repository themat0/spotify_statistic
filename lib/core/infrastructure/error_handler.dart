import 'package:easy_localization/easy_localization.dart';
import 'package:logger/logger.dart';
import 'package:spotify_statistic/core/helpers/rest_api_exception.dart';
import 'package:spotify_statistic/data/token_repository.dart';

import '../../generated/locale_keys.g.dart';

class ErrorHandler {

  ErrorHandler(this._tokenRepository);

  final TokenRepository _tokenRepository;

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

  String getHandleError(error) {
    logger.e(error.toString());
    switch (error.runtimeType) {
      case String:
        return LocaleKeys.sthWentWrong.tr();
      case RestApiException:
        return _handleResponseError(error);
      default:
        return LocaleKeys.sthWentWrong.tr();
    }
  }

  String _handleResponseError(RestApiException error) {
    if (error.statusCode == 401) {
      _tokenRepository.deleteToken();
      return LocaleKeys.tokenExpired.tr();
    } else {
      return LocaleKeys.sthWentWrong.tr();
    }
  }
}
