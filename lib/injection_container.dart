import 'package:cats_app/features/cats/data/repositories/cats_repository_implement.dart';
import 'package:get_it/get_it.dart';
import 'core/network/dio_client.dart';
import 'features/cats/domain/repositories/cats_repository.dart';
import 'features/cats/presentation/bloc/cats_bloc.dart'; // Importa tu Bloc

// sl = Service Locator (Localizador de Servicios)
final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => CatsBloc(sl()));
  sl.registerLazySingleton<CatsRepository>(
    () => CatsRepositoryImplement(client: sl()),
  );
  sl.registerLazySingleton(() => DioClient());
}
