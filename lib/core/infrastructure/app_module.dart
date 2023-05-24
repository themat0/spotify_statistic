import 'package:koin/koin.dart';
import 'package:spotify_statistic/core/infrastructure/error_handler.dart';
import 'package:spotify_statistic/core/widgets/snackbar.dart';
import 'package:spotify_statistic/data/spotify_api_service.dart';
import 'package:spotify_statistic/data/spotify_repository.dart';
import 'package:spotify_statistic/data/token_repository.dart';
import 'package:spotify_statistic/features/artistsScreen/cubit/artists_cubit.dart';
import 'package:spotify_statistic/features/globalUi/cubit/global_ui_cubit.dart';
import 'package:spotify_statistic/features/profileScreen/cubit/profile_cubit.dart';
import 'package:spotify_statistic/features/splashScreen/cubit/splash_screen_cubit.dart';
import 'package:spotify_statistic/features/tracksScreen/cubit/tracks_cubit.dart';

import '../../features/homeView/bloc/home_bloc.dart';
import '../../features/loginScreen/cubit/login_screen_cubit.dart';

final appModule = Module()
  ..single((scope) => SnackBarUtils())
  ..single((scope) => TokenRepository())
  ..single((scope) => ErrorHandler(scope.get<TokenRepository>()))
  ..single((scope) => SpotifyApiService(scope.get<TokenRepository>()))
  ..single((scope) => GlobalUiCubit(scope.get<ErrorHandler>()))
  ..single((scope) => SpotifyRepository(scope.get<SpotifyApiService>()))
  ..single((scope) => SplashScreenCubit(scope.get<TokenRepository>()))
  ..factory((scope) => LoginScreenCubit(scope.get<SpotifyRepository>(),
      scope.get<GlobalUiCubit>(), scope.get<TokenRepository>()))
  ..factory((scope) => HomeBloc(scope.get<TokenRepository>()))
  ..factory((scope) =>
      ArtistsCubit(scope.get<SpotifyRepository>(), scope.get<GlobalUiCubit>()))
  ..factory((scope) =>
      TracksCubit(scope.get<SpotifyRepository>(), scope.get<GlobalUiCubit>()))
  ..factory((scope) => ProfileCubit(scope.get<SpotifyRepository>(),
      scope.get<GlobalUiCubit>(), scope.get<TokenRepository>()));
