class UserLogInRequest {
  final String email;
  final String password;

  UserLogInRequest({
    required this.email,
    required this.password,
  });

  factory UserLogInRequest.fromJson(Map<String, dynamic> json) {
    return UserLogInRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class UserSignUpRequest {
  final String email;
  final String password;

  UserSignUpRequest({
    required this.email,
    required this.password,
  });

  factory UserSignUpRequest.fromJson(Map<String, dynamic> json) {
    return UserSignUpRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}