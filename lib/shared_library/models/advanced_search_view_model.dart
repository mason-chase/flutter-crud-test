import 'advanced_search_type_enum.dart';

class AdvancedSearchViewModel {
  String? key;
  String? text;
  String? startValue;
  String? endValue;
  AdvancedSearchType? type;
  bool? show;

  AdvancedSearchViewModel({
    final this.key,
    final this.text,
    final this.startValue,
    final this.endValue,
    final this.type,
    final this.show,
  });
}
