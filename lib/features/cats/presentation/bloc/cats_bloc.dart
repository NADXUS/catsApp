import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/cat_entity.dart';
import '../../domain/repositories/cats_repository.dart';

part 'cats_event.dart';
part 'cats_state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  final CatsRepository _repository;

  CatsBloc(this._repository) : super(CatsInitial()) {
    // Mapeamos el evento FetchCats a la función _onFetchCats
    on<FetchCats>(_onFetchCats);
  }

  Future<void> _onFetchCats(FetchCats event, Emitter<CatsState> emit) async {
    emit(CatsLoading());
    try {
      final cats = await _repository.fetchCats();
      emit(CatsLoaded(cats));
    } catch (e) {
      // El mensaje del interceptor se propaga hasta aquí
      emit(CatsError(e.toString()));
    }
  }
}
