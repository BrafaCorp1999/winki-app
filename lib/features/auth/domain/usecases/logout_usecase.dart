import 'package:wink/core/depandancy_injection/service_locator.dart';
import 'package:wink/core/usecase/usecase.dart';
import 'package:wink/features/auth/domain/repository/auth_repo.dart';

class LogoutUsecase extends UseCase<void, NoParams> {
  @override
  Future<void> call({NoParams? param}) async {
    await sl<AuthRepo>().logout();
  }
}
