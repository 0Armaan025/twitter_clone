import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/core.dart';

final authAPIProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountProvider);
  return AuthAPI(account: account);
});

abstract class IAuthAPI {
  FutureEither<model.User> signUp({
    required String email,
    required String password,
  });

  FutureEither<model.Session> logIn({
    required String email,
    required String password,
  });

  Future<model.User?> currentUserAccount();
}

class AuthAPI implements IAuthAPI {
  final Account _account;

  AuthAPI({required Account account}) : _account = account;

  @override
  FutureEither<model.User> signUp(
      {required String email, required String password}) async {
    try {
      final account = await _account.create(
          userId: 'unique()', email: email, password: password);
        
      return right(account);
      
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
  
  @override
  FutureEither<model.Session> logIn({required String email, required String password}) async {
    try {
      final account = await _account.createEmailSession(email: email, password: password);
      return right(account);
    }
    catch(e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
  
  @override
  Future<model.User?> currentUserAccount() async {
    try {
      return await _account.get();
    }
    catch(e){
      return null;
    }
    
  }
}
