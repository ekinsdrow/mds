import 'package:flutter/material.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/common/data/models/records.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
    required this.records,
  }) : super(key: key);

  final List<Record> records;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => Records(
        records: records,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Builder(
              builder: (context) {
                return ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      context.read<Records>().records[index].title,
                    ),
                  ),
                  itemCount: context.read<Records>().records.length,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
