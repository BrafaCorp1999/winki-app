import 'package:wink/core/depandancy_injection/service_locator.dart';
import 'package:wink/core/usecase/usecase.dart';
 import 'package:wink/features/auth/data/models/login_response.dart';
import 'package:wink/features/auth/domain/repository/auth_repo.dart';

class GetCachedUserUsecase extends UseCase<LoginUserData?, NoParams> {
  @override
  Future<LoginUserData?> call({NoParams? param}) async {
    return await sl<AuthRepo>().getCachedUser();
  }
}
