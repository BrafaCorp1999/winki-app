import 'package:dartz/dartz.dart';
import 'package:wink/core/depandancy_injection/service_locator.dart';
import 'package:wink/core/usecase/usecase.dart';
import 'package:wink/features/auth/data/models/register_req_body.dart';
import 'package:wink/features/auth/data/models/register_response.dart';
import 'package:wink/features/auth/domain/repository/auth_repo.dart';

class RegisterUsecase extends UseCase<Either, RegisterParams> {
  @override
  Future<Either<String, RegisterUserData>> call({RegisterParams? param}) async {
    if (param == null) throw ArgumentError('RegisterParams cannot be null');

    return await sl<AuthRepo>()
        .register(registerReqBody: param.registerReqBody);
  }
}

class RegisterParams {
  final RegisterReqBody registerReqBody;

  RegisterParams({required this.registerReqBody});
}
