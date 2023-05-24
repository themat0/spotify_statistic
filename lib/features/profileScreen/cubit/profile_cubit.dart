import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify_statistic/data/spotify_repository.dart';
import 'package:spotify_statistic/data/token_repository.dart';
import 'package:spotify_statistic/features/globalUi/cubit/global_ui_cubit.dart';

import '../../../data/models/user_object.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
      this._spotifyRepository, this._globalUiCubit, this._tokenRepository)
      : super(ProfileInitial());

  final SpotifyRepository _spotifyRepository;
  final GlobalUiCubit _globalUiCubit;
  final TokenRepository _tokenRepository;

  void init() async {
    _globalUiCubit.showLoading();
    final user = await _spotifyRepository.getUserInfo();
    if (user.isSuccessful) {
      emit(ProfileLoaded(user.data!));
    }
    _globalUiCubit.hideLoading();
  }

  void logout() {
    _tokenRepository.deleteToken();
    emit(ProfileLogoutSuccess());
  }
}
