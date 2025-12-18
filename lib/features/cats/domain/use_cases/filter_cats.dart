import 'package:cats_app/features/cats/domain/entities/cat_entity.dart';
import 'package:cats_app/features/cats/domain/repositories/cats_repository.dart';

class FilterCatsUseCase {
  final CatsRepository repository;

  FilterCatsUseCase(this.repository);

  Future<List<CatEntity>> call(String breed, List<CatEntity> allCats) async {
    return await repository.filterCats(breed, allCats);
  }
}
