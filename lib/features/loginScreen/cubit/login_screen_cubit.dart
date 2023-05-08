import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify_statistic/data/database.dart';
import 'package:spotify_statistic/data/spotify_repository.dart';
import 'package:spotify_statistic/features/globalUi/cubit/global_ui_cubit.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit(this._spotifyRepository, this._globalUiCubit)
      : super(LoginScreenInitial());

  final SpotifyRepository _spotifyRepository;
  final GlobalUiCubit _globalUiCubit;

  void login() async {
    _globalUiCubit.showLoading();
    final token = await _spotifyRepository.getAccessToken();
    _globalUiCubit.hideLoading();
    if (token.isSuccessful) {
      await Database.write(key: "TOKEN", value: token.requiredData);
      emit(LoginScreenSuccess());
    } else {
      _globalUiCubit.showSnackBarError(token.errorResponse);
    }
  }
}
