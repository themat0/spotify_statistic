import 'package:bloc/bloc.dart';
import 'package:spotify_statistic/data/database.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenState.initial);

  void init() async {
    await Future.delayed(const Duration(seconds: 2));
    if (await Database.read(key: "TOKEN") != null) {
      emit(SplashScreenState.loggedIn);
    } else {
      emit(SplashScreenState.notLogged);
    }
  }
}
