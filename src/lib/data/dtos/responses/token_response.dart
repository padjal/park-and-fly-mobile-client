class TokenResponse {
  final String tokenType;
  final String accessToken;
  final int expiresIn;
  final String refreshToken;

  TokenResponse(this.tokenType, this.accessToken, this.expiresIn, this.refreshToken);

  TokenResponse.fromJson(Map<String, dynamic> json)
      : tokenType = json['tokenType'] as String,
        accessToken = json['accessToken'] as String,
        expiresIn = json['expiresIn'] as int,
        refreshToken = json['refreshToken'] as String;
}
