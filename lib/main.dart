import 'package:flutter/material.dart';
import 'package:tasks/core/cache/shared_pref.dart';

import 'package:tasks/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}
