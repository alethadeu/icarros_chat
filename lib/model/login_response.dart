class LoginResponse {
  final String token;
  final bool auth;
  final int id;
  final int expiresIn;

  LoginResponse(this.token, this.auth, this.expiresIn, this.id);

  LoginResponse.fromJson(Map<String, dynamic> json)
      : token = json["token"],
        id = json["id"],
        expiresIn = json["expiresIn"],
        auth = json["auth"];
  
}