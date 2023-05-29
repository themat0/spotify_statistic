import 'package:bloc/bloc.dart';
import 'package:spotify_statistic/data/token_repository.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit(this._tokenRepository) : super(SplashScreenState.initial);

  final TokenRepository _tokenRepository;

  void init() async {
    //await Future.delayed(const Duration(seconds: 2));
    if (await _tokenRepository.getToken() != null) {
      emit(SplashScreenState.loggedIn);
    } else {
      emit(SplashScreenState.notLogged);
    }
  }
}
