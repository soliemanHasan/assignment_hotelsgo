import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/base_state.dart';
import '../../../domin/entities/category_entity.dart';
import '../../../domin/repository/home_repository.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, BaseState<List<CategoryEntity>>> {
  final HomeRepository homeRepository;

  HomeBloc(this.homeRepository)
      : super(const BaseState<List<CategoryEntity>>()) {
    on<FetchCategoryEvent>(_getHome);
  }
  FutureOr<void> _getHome(FetchCategoryEvent event, emit) async {
    emit(state.loading());
    final result = await homeRepository.getCategories();
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
}
