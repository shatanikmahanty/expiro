import 'package:expiro/utils/mixins/cubit_maybe_emit_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../authentication.dart';

part 'auth_cubit.freezed.dart';
part 'auth_cubit.g.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    AppUser? user,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}

class AuthCubit extends HydratedCubit<AuthState> with CubitMaybeEmit {
  ///Singleton
  static AuthCubit get instance => _instance;
  static final AuthCubit _instance = AuthCubit._internal();

  AuthCubit._internal() : super(const AuthState());

  bool get isSignedIn => state.user != null;

  void login(AppUser user) => emit(
        state.copyWith(
          user: user,
        ),
      );

  Future<void> loginWithProvider(String provider) async {
    //TODO login server logic

    await checkIfAccountExists(provider);
  }

  Future<void> checkIfAccountExists(String provider) async {}

  Future<void> getUser() async {
    // final document = await _apiClient!.databases.getDocument(
    //   databaseId: EnvironmentHelper().getDatabaseId(),
    //   collectionId: kUsersCollection,
    //   documentId: state.user!.id,
    // );
    // final appUser = AppUser.fromJson(document.data);
    // emit(
    //   state.copyWith(
    //     user: appUser,
    //   ),
    // );
  }

  Future<AppUser> createUser() async {
    return AppUser(
      id: 'id',
      name: 'name',
      email: 'email',
    );
  }

  Future<void> logout() async {
    //TODO logout server logic
    emit(
      state.copyWith(
        user: null,
      ),
    );
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) => state.toJson();

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    ///We don't want to persist these values
    json.remove('isOtpAvailable');
    json.remove('phoneSessionId');
    return AuthState.fromJson(json);
  }
}
