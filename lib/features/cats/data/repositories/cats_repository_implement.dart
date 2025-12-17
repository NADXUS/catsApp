import 'package:cats_app/core/errors/custom_errors.dart';
import 'package:cats_app/core/network/dio_client.dart';
import 'package:cats_app/features/cats/data/models/cat_model.dart';
import 'package:cats_app/features/cats/domain/entities/cat_entity.dart';
import 'package:cats_app/features/cats/domain/repositories/cats_repository.dart';
import 'package:dio/dio.dart';

class CatsRepositoryImplement implements CatsRepository {
  final DioClient client;

  CatsRepositoryImplement({required this.client});

  @override
  Future<List<CatEntity>> fetchCats() async {
    try {
      final response = await client.dio.get('/breeds');
      final List data = response.data['data'] as List;
      return data.map((e) => CatModel.fromJson(e)).toList();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw ServerError(e.message ?? "Error de conexión con el servidor");
      }
      if (e.type == DioExceptionType.badResponse) {
        throw ServerError(e.message ?? "Error de validación de datos");
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        throw NetworkError(
          e.message ?? "Tiempo de espera de respuesta agotado",
        );
      }
      throw NetworkError(e.message ?? "Error de red inesperado");
    } catch (e) {
      throw ServerError("Error inesperado: $e");
    }
  }

  @override
  Future<void> getDetails(String idCat) async {
    // AQUÍ va el código real con Dio que ya hicimos
  }

  @override
  Future<void> filterCats(String breed, String age, String gender) async {
    // AQUÍ va el código real con Dio que ya hicimos
  }

  @override
  Future<void> sortCats(String sort) async {
    // AQUÍ va el código real con Dio que ya hicimos
  }
}
