import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify_statistic/core/infrastructure/error_handler.dart';

part 'global_ui_state.dart';

class GlobalUiCubit extends Cubit<GlobalUiState> {
  GlobalUiCubit() : super(GlobalUiInitial());

  final ErrorHandler _errorHandler = ErrorHandler();

  void showSnackBarError(dynamic message) {
    emit(GlobalUiSnackBarError(_errorHandler.getHandleError(message)));
  }
  void showLoading() {
    emit(GlobalUiLoading());
  }

  void hideLoading() {
    emit(GlobalUiInitial());
  }
}
