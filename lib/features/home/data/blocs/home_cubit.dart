import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';

part 'home_cubit.freezed.dart';

part 'home_cubit.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required int aqi,
    required String location,
    @Default([]) List<String> diseases,
    String? advisory,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          const HomeState(
            aqi: 78,
            location: 'Electronics City Phase 1',
            diseases: ['Asthma', 'Heart Diseases', 'Sensitive Groups'],
            advisory: 'Good day to be active outside.\nContinue with normal activities.',
          ),
        );
}
