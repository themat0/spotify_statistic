import 'package:koin/koin.dart';
import 'package:spotify_statistic/core/widgets/snackbar.dart';
import 'package:spotify_statistic/data/spotify_api_service.dart';
import 'package:spotify_statistic/data/spotify_repository.dart';
import 'package:spotify_statistic/features/globalUi/cubit/global_ui_cubit.dart';
import 'package:spotify_statistic/features/splashScreen/cubit/splash_screen_cubit.dart';

import '../../features/loginScreen/cubit/login_screen_cubit.dart';

final appModule = Module()
      ..single((scope) => SnackBarUtils())
      ..single((scope) => SpotifyApiService())
      ..single((scope) => GlobalUiCubit())
      ..single((scope) => SpotifyRepository(scope.get<SpotifyApiService>()))
      ..single((scope) => SplashScreenCubit())
      ..factory((scope) => LoginScreenCubit(
          scope.get<SpotifyRepository>(), scope.get<GlobalUiCubit>()))
//..factoryWithParam((scope, HomeMenuInitial param) => HomeMenuCubit(param,scope.get<NavigationService>(),scope.get<PreferencesProvider>(),scope.get<NotificationsUtils>(),))
    ;
