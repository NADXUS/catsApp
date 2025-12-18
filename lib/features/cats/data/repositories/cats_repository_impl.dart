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
  Future<List<CatEntity>> filterCats(String breed, String age, String gender) {
    // TODO: implement filterCats
    throw UnimplementedError();
  }

  @override
  Future<List<CatEntity>> getDetails(String idCat) {
    // TODO: implement getDetails
    throw UnimplementedError();
  }

  @override
  Future<List<CatEntity>> sortCats(String sort) {
    // TODO: implement sortCats
    throw UnimplementedError();
  }
}
