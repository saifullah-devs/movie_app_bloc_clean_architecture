class EnvConfig {
  static const String _apiKeyEnvironmentVariableKey = 'API_KEY';

  static const String apiKey = String.fromEnvironment(
    _apiKeyEnvironmentVariableKey,
    defaultValue: '',
  );
}
