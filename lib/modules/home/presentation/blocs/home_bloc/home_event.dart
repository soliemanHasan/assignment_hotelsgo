part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class FetchCategoryEvent extends HomeEvent {
  const FetchCategoryEvent();
}
