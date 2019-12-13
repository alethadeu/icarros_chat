class LoginResponse {
  final String token;
  final bool auth;

  LoginResponse(this.token, this.auth);

  LoginResponse.fromJson(Map<String, dynamic> json)
      : token = json["token"],
        auth = json["auth"];
  
}