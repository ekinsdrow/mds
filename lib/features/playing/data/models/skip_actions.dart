
import 'package:mds/common/data/models/record.dart';

abstract class SkipAction {
  final Record record;

  SkipAction(this.record);
}

class NextSkip extends SkipAction {
  NextSkip(Record record) : super(record);
}

class PreviousSkip extends SkipAction {
  PreviousSkip(Record record) : super(record);
}