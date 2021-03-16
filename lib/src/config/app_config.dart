import 'package:air_design/src/config/card_config.dart';

///
/// AppConfig
class AppConfig {
  static AppConfig _instance;
  AppConfig._();

  static AppConfig instance() {
    if (_instance == null) {
      _instance = AppConfig._();
    }
    return _instance;
  }

  Config _config = Config();

  set config(Config config) {}

  Config get config => _config;
}

///
/// Config
class Config {
  CardConfig cardConfig;

  Config({
    this.cardConfig,
  }) {
    cardConfig ??= CardConfig();
  }
}
