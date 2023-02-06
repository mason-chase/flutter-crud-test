import 'package:another_flushbar/flushbar.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Flushbar get flushbar => Flushbar();
}
