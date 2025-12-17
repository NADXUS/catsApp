// lib/features/cats/presentation/bloc/cats_event.dart

// Añade esta línea:
part of 'cats_bloc.dart';

sealed class CatsEvent {}

final class FetchCats extends CatsEvent {}

final class FilterCats extends CatsEvent {}
