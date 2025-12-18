import 'package:get_it/get_it.dart';
import 'package:shop/domain/repositories/login_repository.dart';
import 'package:shop/domain/usecase/impl/login_usecase_impl.dart';
import 'package:shop/domain/usecase/login_usecase.dart';
import 'package:shop/data/repositories/login_repository_impl.dart';
import 'package:shop/presentation/bloc/login/login_bloc.dart';

var getIt = GetIt.I;

void init() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
  getIt.registerLazySingleton<LoginUsecase>(() => LoginUsecaseImpl(getIt()));
  getIt.registerFactory(() => LoginBloc(getIt()));
}
