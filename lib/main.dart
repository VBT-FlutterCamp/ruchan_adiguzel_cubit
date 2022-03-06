import 'package:flutter/material.dart';

import 'list/view/post_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Material App',
      home: LoginView(),
    );
  }
}
