import 'package:cats_app/features/cats/domain/entities/cat_entity.dart';
import 'package:cats_app/features/cats/domain/repositories/cats_repository.dart';

class FetchCatsUseCase {
  final CatsRepository repository;

  FetchCatsUseCase(this.repository);

  Future<List<CatEntity>> call() async {
    return await repository.fetchCats();
  }
}
