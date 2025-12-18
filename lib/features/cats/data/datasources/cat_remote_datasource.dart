import 'package:cats_app/core/network/dio_client.dart';
import 'package:cats_app/features/cats/data/models/cat_model.dart';
import 'package:cats_app/features/cats/domain/entities/cat_entity.dart';

abstract class CatRemoteDatasource {
  Future<List<CatEntity>> fetchCats();
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
}
