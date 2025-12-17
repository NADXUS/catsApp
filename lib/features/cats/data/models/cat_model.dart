import '../../domain/entities/cat_entity.dart';

class CatModel extends CatEntity {
  CatModel({
    required super.id,
    required super.name,
    required super.temperament,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      id: json['id'] ?? 'N/A', // Valor por defecto para evitar error de Null
      name: json['name'] ?? 'Desconocido', // Valor por defecto
      temperament: json['temperament'] ?? 'Desconocido', // Valor por defecto
    );
  }
}
