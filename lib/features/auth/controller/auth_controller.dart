import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/apis/auth_api.dart';
import 'package:appwrite/models.dart' as model;
import 'package:twitter_clone/apis/user_api.dart';
import 'package:twitter_clone/core/utils.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';
import 'package:twitter_clone/features/view/home_view.dart';
import 'package:twitter_clone/models/user_model.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, dynamic>((ref) {
  final authAPI = ref.watch(authAPIProvider);

  return AuthController(authAPI: authAPI, userAPI: ref.watch(userAPIProvider));
});

final currentUserAccountProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.currentUser();
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  final UserAPI _userAPI;
  AuthController({required AuthAPI authAPI, required UserAPI userAPI})
      : _authAPI = authAPI,
        _userAPI = userAPI,
        super(false);

  //isLoading
  // state = isLoading
  // by riverpod

  Future<model.User?> currentUser() => _authAPI.currentUserAccount();

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authAPI.signUp(email: email, password: password);
    state = false;
    res.fold((l) {
      showSnackBar(context, l.message);
    }, (r) async {
      UserModel userModel = UserModel(
          name: getNameFromEmail(email),
          email: email,
          followers: const [],
          following: const [],
          profilePicture: '',
          bannerPicture: '',
          uid: '',
          bio: '',
          isTwitterBlue: false);
      final res2 = await _userAPI.saveUserData(userModel);
      res2.fold((l) {
        showSnackBar(context, l.message);
      }, (_) {
        showSnackBar(context, 'Account created! Please log in!');
        Navigator.push(context, LoginView.route());
      });
    });
  }

  void logIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authAPI.logIn(email: email, password: password);
    state = false;
    res.fold((l) {
      showSnackBar(context, l.message);
    }, (r) {
      showSnackBar(context, 'Successfully logged in!');
      Navigator.of(context).push(HomeView.route());
    });
  }
}
