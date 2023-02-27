import 'package:flutter/material.dart';

class NotFoundPage extends StatefulWidget {
  static const String routeName = "notFoundPage";

  const NotFoundPage({Key? key}) : super(key: key);

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("404"),
      ),
    );
  }
}
