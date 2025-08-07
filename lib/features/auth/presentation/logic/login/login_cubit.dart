import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wink/core/depandancy_injection/service_locator.dart';
import 'package:wink/core/enums/status.dart';
import 'package:wink/features/auth/domain/usecases/login_usecase.dart';
import 'package:wink/features/auth/presentation/logic/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> login(LoginParms params) async {
    emit(state.copyWith(status: LoginStatus.loading));

    final result = await sl<LoginUsecase>().call(param: params);

    result.fold(
      (error) {
        emit(state.copyWith(
          status: LoginStatus.failure,
          message: error.toString(), // Handle error appropriately
        ));
      },
      (success) {
        emit(state.copyWith(
          status: LoginStatus.success,
          message: "Inicio de sesión correcto correctamente"
          //message: "مرحباً بعودتك", // Adjust based on response
        ));
      },
    );
  }
}
