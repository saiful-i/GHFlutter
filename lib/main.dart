import 'package:flutter/material.dart';
import 'ghflutter.dart';
import 'string.dart' as strings;

void main() => runApp(const GHFlutterApp());

class GHFlutterApp extends StatelessWidget {
  const GHFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: strings.appTitle,
      theme: ThemeData(primaryColor: Colors.green.shade800),
      home: GHFlutter(),
    );
  }
}