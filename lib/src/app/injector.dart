import 'package:booking_app/src/app/core/helpers/api_helpert.dart';
import 'package:booking_app/src/features/auth/data/repo/auth_repo.dart';
import 'package:booking_app/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // sl.registerFactory(() => AppBloc(
  //   repository: sl(),
  // ));

  sl.registerLazySingleton<DioHelper>(
    () => DioImpl(),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => RepositoryImplementation(
      dioHelper: sl(),
    ),
  );

  sl.registerFactory(() => AuthCubit(
        repository: sl<AuthRepository>(),
      ));
}
