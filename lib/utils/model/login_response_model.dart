class LoginResponse {
  int? statusCode;
  String? message;
  Data? data;

  LoginResponse({this.statusCode, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  int? otp;
  String? token;

  Data({this.user, this.otp, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    otp = json['otp'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['otp'] = this.otp;
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? role;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? emailAddress;
  int? userId;
  String? profileImage;

  User(
      {this.role,
        this.phoneNumber,
        this.firstName,
        this.lastName,
        this.emailAddress,
        this.userId,
        this.profileImage});

  User.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    phoneNumber = json['phone_number'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    emailAddress = json['email_address'];
    userId = json['user_id'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['phone_number'] = this.phoneNumber;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email_address'] = this.emailAddress;
    data['user_id'] = this.userId;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
