import 'package:flutter/material.dart';
import 'package:mds/common/data/models/record.dart';

class MainScope extends StatelessWidget {
  const MainScope({
    Key? key,
    required this.child,
    required this.records,
  }) : super(key: key);

  final Widget child;
  final List<Record> records;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
