import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/constants/constants.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:twitter_clone/models/user_model.dart';


final userAPIProvider = Provider((ref)  {
  final databaseProvider = ref.watch(appwriteDatabaseProvider);
  return UserAPI(db: databaseProvider);
});

abstract class IUserAPI {
  FutureEitherVoid saveUserData(UserModel userModel);
}

class UserAPI extends IUserAPI {
  final Databases _db;

  UserAPI({required Databases db}) : _db = db;
  @override
  FutureEitherVoid saveUserData(UserModel userModel) async {
    try {
      final document = await _db.createDocument(
          databaseId: AppwriteConstants.databaseId,
          collectionId: AppwriteConstants.usersCollection,
          documentId: ID.unique(),
          data: userModel.toMap());
      return right(null);
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }
}
