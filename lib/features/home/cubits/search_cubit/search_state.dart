part of 'search_cubit.dart';

@immutable
sealed class SearchState extends Equatable {
  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<MovieModel> movies;

  SearchSuccess({required this.movies});

  @override
  List<Object> get props => [movies];
}

final class SearchFailure extends SearchState {
  final String error;

  SearchFailure({required this.error});

  @override
  List<Object> get props => [error];
}
