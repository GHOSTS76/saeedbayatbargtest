// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Users _$$_UsersFromJson(Map<String, dynamic> json) => _$_Users(
      username: json['username'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      balance: json['balance'] as String?,
      registered: json['registered'] as String?,
      about: json['about'] as String?,
      greeting: json['greeting'] as String?,
      friends: json['friends'] as List<dynamic>?,
      favoriteFruit: json['favoriteFruit'] as String?,
      picture: json['picture'] as String?,
      age: json['age'] as int?,
    );

Map<String, dynamic> _$$_UsersToJson(_$_Users instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'balance': instance.balance,
      'registered': instance.registered,
      'about': instance.about,
      'greeting': instance.greeting,
      'friends': instance.friends,
      'favoriteFruit': instance.favoriteFruit,
      'picture': instance.picture,
      'age': instance.age,
    };
