part of 'cats_bloc.dart';

sealed class CatsState {}

final class CatsInitial extends CatsState {}

final class CatsLoading extends CatsState {}

final class CatsLoaded extends CatsState {
  final List<CatEntity> cats;
  CatsLoaded(this.cats);
}

final class CatsError extends CatsState {
  final String message;
  CatsError(this.message);
}
