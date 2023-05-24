import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:spotify_statistic/data/token_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._tokenRepository) : super(const HomeState(index: 0)) {
    on<HomeEvent>((event, emit) {
      if (event is HomeChangeMenuEvent) {
        emit(HomeState(index: event.index));
      } else if (event is HomeForceLogout) {
        emit(HomeForceLogoutState(index: state.index));
      }
    });
    _tokenStreamSubscription = _tokenRepository.tokenStream.listen((value) {
      if (value == null) add(HomeForceLogout());
    });
  }

  final TokenRepository _tokenRepository;
  late final StreamSubscription<String?> _tokenStreamSubscription;

  @override
  Future<void> close() {
    _tokenStreamSubscription.cancel();
    return super.close();
  }
}
