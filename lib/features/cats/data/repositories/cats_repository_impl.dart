import 'package:cats_app/core/errors/custom_errors.dart';
import 'package:cats_app/features/cats/data/datasources/cat_remote_datasource.dart';
import 'package:cats_app/features/cats/domain/entities/cat_entity.dart';
import 'package:cats_app/features/cats/domain/repositories/cats_repository.dart';
import 'package:dio/dio.dart';

class CatsRepositoryImpl implements CatsRepository {
  late final CatRemoteDatasourceImplement remoteDatasource;
  CatsRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<CatEntity>> fetchCats() async {
    try {
      final responseCats = await remoteDatasource.fetchCats();
      return responseCats;
    } on DioException catch (dioError) {
      if (dioError.type == DioExceptionType.connectionTimeout) {
        throw ServerError('Connection Timeout, please try again.');
      }
      if (dioError.type == DioExceptionType.badResponse) {
        throw ServerError('Bad Response, please try again.');
      }

      throw ServerError('Something went wrong, please try again.');
    } catch (e) {
      throw ServerError('Something went wrong, please try again. $e');
    }
  }

  @override
  Future<List<CatEntity>> filterCats(
    String breed,
    List<CatEntity> allCats,
  ) async {
    if (breed.isEmpty) {
      return allCats;
    }

    final filteredList = allCats.where((cat) {
      final nameLower = cat.name.toLowerCase();
      final searchLower = breed.toLowerCase();

      return nameLower.contains(searchLower);
    }).toList();

    return filteredList;
  }
}
