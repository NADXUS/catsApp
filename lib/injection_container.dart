import 'package:cats_app/features/cats/data/repositories/cats_repository_impl.dart';
import 'package:cats_app/features/cats/domain/use_cases/fetch_cats.dart';
import 'package:cats_app/features/cats/domain/use_cases/filter_cats.dart';
import 'package:cats_app/features/cats/domain/use_cases/get_details.dart';
import 'package:cats_app/features/cats/domain/use_cases/sort_cats.dart';
import 'package:get_it/get_it.dart';
import 'core/network/dio_client.dart';
import 'features/cats/data/datasources/cat_remote_datasource.dart';
import 'features/cats/domain/repositories/cats_repository.dart';
import 'features/cats/presentation/bloc/cats_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {
  //bloc
  di.registerFactory(() => CatsBloc(di(), di(), di(), di()));

  //use cases
  di.registerLazySingleton<FetchCatsUseCase>(() => FetchCatsUseCase(di()));
  di.registerLazySingleton<FilterCatsUseCase>(() => FilterCatsUseCase(di()));
  di.registerLazySingleton<SortCatsUseCase>(() => SortCatsUseCase(di()));
  di.registerLazySingleton<GetDetailsUseCase>(() => GetDetailsUseCase(di()));

  //datasource
  di.registerLazySingleton<DioClient>(() => DioClient());
  di.registerLazySingleton<CatRemoteDatasourceImplement>(
    () => CatRemoteDatasourceImplement(client: di()),
  );

  //repository
  di.registerLazySingleton<CatsRepository>(
    () => CatsRepositoryImpl(remoteDatasource: di()),
  );
}
