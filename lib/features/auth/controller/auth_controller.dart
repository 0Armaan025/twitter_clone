import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/apis/auth_api.dart';
import 'package:appwrite/models.dart' as model;
import 'package:twitter_clone/core/utils.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';
import 'package:twitter_clone/features/view/home_view.dart';


final authControllerProvider = StateNotifierProvider<AuthController, dynamic>((ref) {
  final authAPI = ref.watch(authAPIProvider);
  return AuthController(authAPI: authAPI);
});

final currentUserAccountProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.currentUser();
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  AuthController({required AuthAPI authAPI})
      : _authAPI = authAPI,
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
    }, (r) {
      showSnackBar(context, 'Account created! Please log in!');
      Navigator.push(context, LoginView.route());
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
