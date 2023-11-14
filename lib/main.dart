import 'package:flutter/material.dart';
import 'package:movie_app/app.dart';
import 'package:movie_app/core/di/service_locator.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(const MovieApp());
}
