class User {
  final String id;
  String? firstname;
  String? lastname;
  final String role;
  final String email;
  String? phoneNumber;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.role,
    required this.email,
    required this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      role: json['role'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'role': role,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}

class AuthData {
  String? userEmail;
  final String accessToken;
  final String refreshToken;
  final User user;

  AuthData({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
    this.userEmail,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'user': user.toJson(),
    };
  }

  AuthData copyWith({
    String? userEmail,
    String? accessToken,
    String? refreshToken,
    User? user,
  }) {
    return AuthData(
      userEmail: userEmail ?? this.userEmail,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      user: user ?? this.user,
      // ... copy other fields similarly
    );
  }
}
