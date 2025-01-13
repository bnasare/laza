class PayStackResponse {
  final String authorizationUrl;
  final String access_code;
  final String reference;

  PayStackResponse(
      {required this.authorizationUrl,
      required this.access_code,
      required this.reference});

  factory PayStackResponse.fromJson(Map<String, dynamic> json) {
    return PayStackResponse(
      authorizationUrl: json['authorizationUrl'],
      access_code: json['access_code'],
      reference: json['reference'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'authorizationUrl': authorizationUrl,
      'access_code': access_code,
      'reference': reference,
    };
  }
}
