import 'package:expiro/features/home/data/models/explore_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../repository/explore_repository.dart';

part 'explore_cubit.freezed.dart';
part 'explore_cubit.g.dart';

@freezed
class ExploreState with _$ExploreState {
  const factory ExploreState({
    @Default(false) bool isLoading,
    @Default([]) List<ExploreModel> blogs,
  }) = _ExploreState;

  factory ExploreState.fromJson(Map<String, dynamic> json) =>
      _$ExploreStateFromJson(json);
}

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit(this._exploreRepository) : super(const ExploreState());

  final ExploreRepository _exploreRepository;

  Future<void> loadBlogs() async {
    emit(state.copyWith(isLoading: true));
    final blogs = await _exploreRepository.fetchProducts();
    emit(
      state.copyWith(
        isLoading: false,
        blogs: blogs,
      ),
    );
  }
}
