import 'package:easy_localization/easy_localization.dart';
import 'package:logger/logger.dart';

import '../../generated/locale_keys.g.dart';

class ErrorHandler {
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
    if (error is String) {
      return "error string";
      //return ApiErrorMessage.getErrorMessage(code: error);
    } else {
      return LocaleKeys.sthWentWrong.tr();
    }
  }

}