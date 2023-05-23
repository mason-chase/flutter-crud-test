import 'advanced_search_type_enum.dart';

class AdvancedSearchViewModel {
  String? key;
  String? text;
  String? startValue;
  String? endValue;
  AdvancedSearchType? type;
  bool? show;

  AdvancedSearchViewModel({
    this.key,
    this.text,
    this.startValue,
    this.endValue,
    this.type,
    this.show,
  });
}
