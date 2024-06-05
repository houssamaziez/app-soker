import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:tomlogin/App/Controller/listofProvider.dart';
import 'package:tomlogin/App/myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: listofprovider,
      child: const MyApp(),
    ),
  );
}
