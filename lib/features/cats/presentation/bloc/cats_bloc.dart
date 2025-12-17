import 'package:cats_app/features/cats/domain/use_cases/fetch_cats.dart';
import 'package:cats_app/features/cats/domain/use_cases/filter_cats.dart';
import 'package:cats_app/features/cats/domain/use_cases/get_details.dart';
import 'package:cats_app/features/cats/domain/use_cases/sort_cats.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/cat_entity.dart';

part 'cats_event.dart';
part 'cats_state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  final FetchCatsUseCase _fetchCatsUseCase;
  final FilterCatsUseCase _filterCatsUseCase;
  final SortCatsUseCase _sortCatsUseCase;
  final GetDetailsUseCase _getDetailsUseCase;

  CatsBloc(
    this._fetchCatsUseCase,
    this._filterCatsUseCase,
    this._sortCatsUseCase,
    this._getDetailsUseCase,
  ) : super(CatsInitial()) {
    on<FetchCats>((event, emit) async {
      emit(CatsLoading());
      try {
        final cats = await _fetchCatsUseCase();
        emit(CatsLoaded(cats));
      } catch (e) {
        emit(CatsError("Failed to fetch cats: $e"));
      }
    });
  }
}
