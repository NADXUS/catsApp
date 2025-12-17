import 'package:cats_app/features/cats/domain/entities/cat_entity.dart';
import 'package:cats_app/features/cats/domain/repositories/cats_repository.dart';

class SortCatsUseCase {
  final CatsRepository repository;

  SortCatsUseCase(this.repository);

  Future<List<CatEntity>> call(String sort) async {
    return await repository.sortCats(sort);
  }
}
