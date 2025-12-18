import 'package:cats_app/features/cats/domain/use_cases/fetch_cats.dart';
import 'package:cats_app/features/cats/domain/use_cases/filter_cats.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/cat_entity.dart';

part 'cats_event.dart';
part 'cats_state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  final FetchCatsUseCase _fetchCatsUseCase;
  final FilterCatsUseCase _filterCatsUseCase;

  List<CatEntity> allCats = [];

  CatsBloc(this._fetchCatsUseCase, this._filterCatsUseCase)
    : super(CatsInitial()) {
    on<FetchCats>((event, emit) async {
      emit(CatsLoading());
      try {
        final cats = await _fetchCatsUseCase();
        allCats = cats;
        emit(CatsLoaded(allCats));
      } catch (e) {
        emit(CatsError("Failed to fetch cats: $e"));
      }
    });
    on<FilterCats>((event, emit) async {
      emit(CatsLoading());
      try {
        final filteredCats = await _filterCatsUseCase(event.breed, allCats);
        emit(CatsLoaded(filteredCats));
      } catch (e) {
        emit(CatsError("Failed to filter cats: $e"));
      }
    });
  }
}
