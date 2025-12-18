import 'package:cats_app/core/network/dio_client.dart';
import 'package:cats_app/features/cats/data/models/cat_model.dart';
import 'package:cats_app/features/cats/domain/entities/cat_entity.dart';

abstract class CatRemoteDatasource {
  Future<List<CatEntity>> fetchCats();
  Future<List<CatEntity>> getDetailsCat(String idCat);
  Future<List<CatEntity>> filterCats(String breed, String age, String gender);
  Future<List<CatEntity>> sortCats(String sort);
}

class CatRemoteDatasourceImplement implements CatRemoteDatasource {
  final DioClient client;

  CatRemoteDatasourceImplement({required this.client});

  @override
  Future<List<CatEntity>> fetchCats() async {
    final responseCats = await client.dio.get('/breeds?limit=30');
    return responseCats.data['data']
        .map<CatModel>((e) => CatModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<CatEntity>> getDetailsCat(String idCat) async {
    final response = await client.dio.get('/breeds?id=$idCat');

    return response.data['data']
        .map<CatModel>((e) => CatModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<CatEntity>> filterCats(
    String breed,
    String age,
    String gender,
  ) async {
    final response = await client.dio.get(
      '/breeds?id=$breed&age=$age&gender=$gender',
    );
    return response.data['data']
        .map<CatModel>((e) => CatModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<CatEntity>> sortCats(String sort) async {
    final response = await client.dio.get('/breeds?sort=$sort');

    return response.data['data']
        .map<CatModel>((e) => CatModel.fromJson(e))
        .toList();
  }
}
