import 'package:cats_app/features/cats/domain/entities/cat.dart';

abstract class CatsRepository {
  Future<List<CatEntity>> fetchCats();
  Future<void> filterCats(String breed, String age, String gender) async {}
  Future<void> sortCats(String sort) async {}
  Future<void> getDetails(String idCat) async {}
}
