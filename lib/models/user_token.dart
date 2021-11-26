class UserToken {
  final bool success;
  final String status;
  final DataToken data;

  UserToken({required this.success, required this.status, required this.data});

  factory UserToken.fromJson(Map<String, dynamic> json) {
    return UserToken(
      success: json['success'],
      status: json['status'],
      data: DataToken.fromJson(json['data']),
    );
  }
}

class DataToken {
  final String token;
  final String role;

  DataToken({required this.token, required this.role});
  factory DataToken.fromJson(Map<String, dynamic> json) {
    return DataToken(token: json['token'], role: json['role']);
  }
}
