class LoginResponse {
  final int status;
  final bool success;
  final UserModel? user;
  final ErrorModel? error;
  final String? accessToken;

  LoginResponse({
    required this.status,
    required this.success,
    required this.user,
    required this.error,
    required this.accessToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'] as int,
      success: json['success'] as bool,
      user: json['data'] != null
          ? UserModel.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      error: json['error'] != null
          ? ErrorModel.fromJson(json['error'] as Map<String, dynamic>)
          : null,
      accessToken: json['access_token'],
    );
  }
}

class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String about;
  final List<Tag> tags;
  final List<String> favoriteSocialMedia;
  final int salary;
  final String email;
  final String birthDate;
  final int gender;
  final UserType type;
  final String avatar;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.about,
    required this.tags,
    required this.favoriteSocialMedia,
    required this.salary,
    required this.email,
    required this.birthDate,
    required this.gender,
    required this.type,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      about: json['about'] as String,
      tags: (json['tags'] as List<dynamic>)
          .map((tagJson) => Tag.fromJson(tagJson as Map<String, dynamic>))
          .toList(),
      favoriteSocialMedia:
          (json['favorite_social_media'] as List<dynamic>).cast<String>(),
      salary: json['salary'],
      email: json['email'] as String,
      birthDate: json['birth_date'] as String,
      gender: json['gender'],
      type: UserType.fromJson(json['type'] as Map<String, dynamic>),
      avatar: json['avatar'] as String,
    );
  }
}

class Tag {
  final int id;
  final String name;

  Tag({
    required this.id,
    required this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}

class UserType {
  final int code;
  final String name;
  final String niceName;

  UserType({
    required this.code,
    required this.name,
    required this.niceName,
  });

  factory UserType.fromJson(Map<String, dynamic> json) {
    return UserType(
      code: json['code'] as int,
      name: json['name'] as String,
      niceName: json['nice_name'] as String,
    );
  }
}

class ErrorModel {
  final String code;
  final String message;

  ErrorModel({
    required this.code,
    required this.message,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      code: json['code'] as String,
      message: json['message'] as String,
    );
  }
}
