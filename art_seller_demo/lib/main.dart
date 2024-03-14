import 'package:flutter/material.dart';

import 'src/app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  usePathUrlStrategy();
  runApp(MyApp());
}
