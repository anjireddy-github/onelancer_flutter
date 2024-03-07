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

class UserRegisterRequest {
  String firstName;
  String lastName;
  String email;
  String password;

  UserRegisterRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  factory UserRegisterRequest.fromJson(Map<String, dynamic> json) {
    return UserRegisterRequest(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
    };
  }
}

class VerifyOtpRequest {
  String uid;
  String otp;

  VerifyOtpRequest({required this.uid, required this.otp});

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) {
    return VerifyOtpRequest(
      uid: json['uid'] ?? '',
      otp: json['otp'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['otp'] = otp;
    return data;
  }
}

