import '../../domain/entities/cat_entity.dart';

class CatModel extends CatEntity {
  CatModel({
    required super.id,
    required super.name,
    required super.temperament,
    required super.origin,
    required super.description,
    required super.lifeSpan,
    required super.adaptability,
    required super.affectionLevel,
    required super.intelligence,
    required super.wikipediaUrl,
    required super.imageUrl,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
      id: json['id'] ?? 'N/A',
      name: json['name'] ?? 'Desconocido',
      temperament: json['temperament'] ?? 'Desconocido',
      origin: json['origin'] ?? 'Desconocido',
      description: json['description'] ?? 'Sin descripción',
      lifeSpan: json['life_span'] ?? 'Desconocido',
      adaptability: json['adaptability']?.toString() ?? '0',
      affectionLevel: json['affection_level']?.toString() ?? '0',
      intelligence: json['intelligence']?.toString() ?? '0',
      wikipediaUrl: json['wikipedia_url'] ?? 'N/A',
      imageUrl: json['image'] != null ? json['image']['url'] ?? '' : '',
    );
  }
}
