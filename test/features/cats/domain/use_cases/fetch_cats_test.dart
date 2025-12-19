// Creamos la clase falsa (el Mock)
import 'package:cats_app/features/cats/domain/entities/cat_entity.dart';
import 'package:cats_app/features/cats/domain/repositories/cats_repository.dart';
import 'package:cats_app/features/cats/domain/use_cases/fetch_cats.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCatRepository extends Mock implements CatsRepository {}

void main() {
  test('retornar gatos cuando el repositorio responde bien', () async {
    final mockRepo = MockCatRepository();
    final useCase = FetchCatsUseCase(mockRepo);

    when(() => mockRepo.fetchCats()).thenAnswer(
      (_) async => [
        CatEntity(
          id: '1',
          name: 'Gato de prueba',
          temperament: 'Playful',
          origin: 'Spain',
          description: 'Descripción de prueba',
          lifeSpan: '10-15',
          adaptability: "5",
          affectionLevel: "5",
          intelligence: "5",
          wikipediaUrl: 'https://es.wikipedia.org/wiki/Gato',
          imageUrl: 'https://example.com/cat.jpg',
        ),
      ],
    );

    final result = await useCase();
    expect(result.first.name, 'Gato de prueba');
  });

  test(
    'retornar una lista vacia cuando el repositorio responde con un error',
    () async {
      final mockRepo = MockCatRepository();
      final useCase = FetchCatsUseCase(mockRepo);

      when(
        () => mockRepo.fetchCats(),
      ).thenThrow(Exception('Error al obtener gatos'));

      final result = await useCase();
      expect(result, []);
    },
  );
}
