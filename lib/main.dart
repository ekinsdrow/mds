import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mds/features/app/app.dart';

//TODO: add zones and BlocObserver
void main() {
  final dio = Dio();

  runApp(
    App(
      dio: dio,
    ),
  );
}
