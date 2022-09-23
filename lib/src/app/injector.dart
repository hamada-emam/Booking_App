import 'package:booking_app/src/app/core/helpers/api_helpert.dart';
import 'package:booking_app/src/features/auth/data/repo/login_data_source.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // sl.registerFactory(() => AppBloc(
  //   repository: sl(),
  // ));

  sl.registerLazySingleton<DioHelper>(
        () => DioImpl(),
  );

  sl.registerLazySingleton<Repository>(
        () => RepositoryImplementation(
      dioHelper: sl(),
    ),
  );
}
