import 'package:flutter/foundation.dart';

@immutable
class UserModel {
  final String name;
  final String email;
  final List<String> followers;
  final List<String> following;
  final String profilePicture;
  final String bannerPicture;
  final String uid;
  final String bio;
  final bool isTwitterBlue;
  const UserModel({
    required this.name,
    required this.email,
    required this.followers,
    required this.following,
    required this.profilePicture,
    required this.bannerPicture,
    required this.uid,
    required this.bio,
    required this.isTwitterBlue,
  });

  UserModel copyWith({
    String? name,
    String? email,
    List<String>? followers,
    List<String>? following,
    String? profilePicture,
    String? bannerPicture,
    String? uid,
    String? bio,
    bool? isTwitterBlue,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      profilePicture: profilePicture ?? this.profilePicture,
      bannerPicture: bannerPicture ?? this.bannerPicture,
      uid: uid ?? this.uid,
      bio: bio ?? this.bio,
      isTwitterBlue: isTwitterBlue ?? this.isTwitterBlue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'followers': followers,
      'following': following,
      'profilePicture': profilePicture,
      'bannerPicture': bannerPicture,
      'bio': bio,
      'isTwitterBlue': isTwitterBlue,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      followers: List<String>.from((map['followers'] as List<String>)),
      following: List<String>.from((map['following'] as List<String>)),
      profilePicture: map['profilePicture'] as String,
      bannerPicture: map['bannerPicture'] as String,
      uid: map['\$id'] as String,
      bio: map['bio'] as String,
      isTwitterBlue: map['isTwitterBlue'] as bool,
    );
  }



  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, followers: $followers, following: $following, profilePicture: $profilePicture, bannerPicture: $bannerPicture, uid: $uid, bio: $bio, isTwitterBlue: $isTwitterBlue)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      listEquals(other.followers, followers) &&
      listEquals(other.following, following) &&
      other.profilePicture == profilePicture &&
      other.bannerPicture == bannerPicture &&
      other.uid == uid &&
      other.bio == bio &&
      other.isTwitterBlue == isTwitterBlue;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      followers.hashCode ^
      following.hashCode ^
      profilePicture.hashCode ^
      bannerPicture.hashCode ^
      uid.hashCode ^
      bio.hashCode ^
      isTwitterBlue.hashCode;
  }
}



