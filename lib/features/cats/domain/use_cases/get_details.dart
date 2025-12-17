import 'package:cats_app/features/cats/domain/entities/cat_entity.dart';
import 'package:cats_app/features/cats/domain/repositories/cats_repository.dart';

class GetDetailsUseCase {
  final CatsRepository repository;

  GetDetailsUseCase(this.repository);

  Future<List<CatEntity>> call(String idCat) async {
    return await repository.getDetails(idCat);
  }
}
