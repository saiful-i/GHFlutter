import 'package:flutter/material.dart';
import 'string.dart' as strings;

void main() => runApp(const GHFlutterApp());

class GHFlutterApp extends StatelessWidget {
  const GHFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GHFlutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(strings.appTitle),
        ),
        body: const Center(
          child: Text(strings.appTitle),
        ),
        ),
    );
  }
}