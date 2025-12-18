import 'package:cats_app/features/cats/domain/entities/cat_entity.dart';

abstract class CatsRepository {
  Future<List<CatEntity>> fetchCats();
  Future<List<CatEntity>> filterCats(String breed, List<CatEntity> allCats);
}
