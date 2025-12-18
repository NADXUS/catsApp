part of 'cats_bloc.dart';

sealed class CatsEvent {}

final class FetchCats extends CatsEvent {}

final class FilterCats extends CatsEvent {
  final String breed;

  FilterCats(this.breed);
}

final class GetCatDetail extends CatsEvent {
  final String id;

  GetCatDetail(this.id);
}
