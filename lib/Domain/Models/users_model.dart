import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_model.freezed.dart';
part 'users_model.g.dart';
@freezed
class Users with _$Users {
  const factory Users({
    required String? username,
    required String? password,
    required String? name,
    required String? email,
    required String? address,
    required String? balance,
    required String? registered,
    required String? about,
    required String? greeting,
    required List? friends,
    required String? favoriteFruit,
    required String? picture,
    required int? age,
  }) = _Users;

  factory Users.fromJson(Map<String, dynamic> json)
  => _$UsersFromJson(json);
}