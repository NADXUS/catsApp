// Creamos la clase falsa (el Mock)
import 'package:cats_app/features/cats/domain/entities/cat_entity.dart';
import 'package:cats_app/features/cats/domain/repositories/cats_repository.dart';
import 'package:cats_app/features/cats/domain/use_cases/filter_cats.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCatRepository extends Mock implements CatsRepository {}

void main() {
  test('filtrar gatos por raza cuando el repositorio responde bien', () async {
    final mockRepo = MockCatRepository();
    final useCase = FilterCatsUseCase(mockRepo);
    when(() => mockRepo.filterCats('Siamese', [])).thenAnswer(
      (_) async => [
        CatEntity(
          id: '2',
          name: 'Siamese Cat',
          temperament: 'Affectionate',
          origin: 'Thailand',
          description: 'A friendly and social breed',
          lifeSpan: '12-15',
          adaptability: "4",
          affectionLevel: "5",
          intelligence: "5",
          wikipediaUrl: 'https://en.wikipedia.org/wiki/Siamese_cat',
          imageUrl: 'https://example.com/siamese_cat.jpg',
        ),
        CatEntity(
          id: '2',
          name: 'Siamese Cat',
          temperament: 'Affectionate',
          origin: 'Thailand',
          description: 'A friendly and social breed',
          lifeSpan: '12-15',
          adaptability: "4",
          affectionLevel: "5",
          intelligence: "5",
          wikipediaUrl: 'https://en.wikipedia.org/wiki/Siamese_cat',
          imageUrl: 'https://example.com/siamese_cat.jpg',
        ),
      ],
    );

    final result = await useCase('Siamese', []);
    expect(result.length, 2);
  });
  test("filtrar por un gato que no existe", () async {
    final mockRepo = MockCatRepository();
    final useCase = FilterCatsUseCase(mockRepo);

    when(() => mockRepo.filterCats(any(), any())).thenAnswer((_) async => []);

    final result = await useCase('Siamese', [
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
    ]);

    expect(result.length, 0);
    verify(() => mockRepo.filterCats('Siamese', any())).called(1);
  });

  test("filtrar con un campo vacio", () async {
    final mockRepo = MockCatRepository();
    final useCase = FilterCatsUseCase(mockRepo);

    when(() => mockRepo.filterCats('', any())).thenAnswer((_) async => []);
    final result = await useCase('', [
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
    ]);

    expect(result.length, 0);
    verify(() => mockRepo.filterCats('', any())).called(1);
  });

  test("filtrar con mayusculas", () async {
    final mockRepo = MockCatRepository();
    final useCase = FilterCatsUseCase(mockRepo);

    when(() => mockRepo.filterCats('SIAMESES', any())).thenAnswer(
      (_) async => [
        CatEntity(
          id: '2',
          name: 'Siamese Cat',
          temperament: 'Affectionate',
          origin: 'Thailand',
          description: 'A friendly and social breed',
          lifeSpan: '12-15',
          adaptability: "4",
          affectionLevel: "5",
          intelligence: "5",
          wikipediaUrl: 'https://en.wikipedia.org/wiki/Siamese_cat',
          imageUrl: 'https://example.com/siamese_cat.jpg',
        ),
      ],
    );

    final result = await useCase('SIAMESES', []);
    expect(result.length, 1);
  });

  test("mostrar error si falla el caso de uso", () async {
    final mockRepo = MockCatRepository();
    final useCase = FilterCatsUseCase(mockRepo);

    when(
      () => mockRepo.filterCats(any(), any()),
    ).thenThrow(Exception('Error al filtrar gatos'));

    expect(() => useCase('Siamese', []), throwsA(isA<Exception>()));
  });
}
