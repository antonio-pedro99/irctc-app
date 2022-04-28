class AuthResponse {
  Object? onError;
  Object? data;

  bool get hasData => data != null;
  bool get hasError => onError != null;
}
