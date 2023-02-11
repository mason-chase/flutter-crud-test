import 'package:flutter/widgets.dart';
import 'package:get/get_instance/get_instance.dart';

typedef GetxViewBuilder<S> = S Function();

abstract class GetxView<T> extends StatelessWidget {
  final GetxViewBuilder<T> _controller;

  const GetxView(this._controller, {final Key? key}) : super(key: key);
  final String? tag = null;

  T get controller => GetInstance().putOrFind<T>(_controller, tag: tag)!;

  @override
  Widget build(final BuildContext context);
}
