class CatEntity {
  final String id;
  final String name;
  final String temperament;

  CatEntity({required this.id, required this.name, required this.temperament});

  factory CatEntity.fromJson(Map<String, dynamic> json) {
    return CatEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      temperament: json['temperament'] as String,
    );
  }
}
