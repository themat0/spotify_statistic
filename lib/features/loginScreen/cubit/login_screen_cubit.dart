import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify_statistic/data/spotify_repository.dart';
import 'package:spotify_statistic/data/token_repository.dart';
import 'package:spotify_statistic/features/globalUi/cubit/global_ui_cubit.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit(this._spotifyRepository, this._globalUiCubit, this._tokenRepository)
      : super(LoginScreenInitial());

  final SpotifyRepository _spotifyRepository;
  final GlobalUiCubit _globalUiCubit;
  final TokenRepository _tokenRepository;

  void login() async {
    _globalUiCubit.showLoading();
    final token = await _spotifyRepository.getAccessToken();
    _globalUiCubit.hideLoading();
    if (token.isSuccessful) {
      await _tokenRepository.saveToken(token.requiredData);
      emit(LoginScreenSuccess());
    } else {
      _globalUiCubit.showSnackBarError(token.errorResponse);
    }
  }
}
