import 'package:pokedex/src/core/translations/en_US/en_us_translation.dart';
import 'package:pokedex/src/core/translations/pt_BR/pt_br_translation.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'pt_BR': ptBR,
    'en_US': enUs,
  };
}
