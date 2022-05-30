import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mds/common/assets/constants.dart';
import 'package:mds/common/extensions/add_zero.dart';
import 'package:mds/features/sleep_timer/data/models/sleep_timer_state.dart';
import 'package:mds/features/sleep_timer/data/models/sleep_timer_status.dart';
import 'package:mds/features/sleep_timer/logic/sleep_timer.dart';

void showSleepTimerModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return const _SleepTimer();
    },
  );
}

class _SleepTimer extends StatefulWidget {
  const _SleepTimer({Key? key}) : super(key: key);

  @override
  State<_SleepTimer> createState() => _SleepTimerState();
}

class _SleepTimerState extends State<_SleepTimer> {
  late StreamSubscription<SleepTimerState> _streamSubscription;
  var _duration = Duration.zero;
  var _status = SleepTimerStatus.stop;

  @override
  void initState() {
    super.initState();
    _streamSubscription = SleepTimer.instance.stateStream.listen(
      (event) {
        setState(() {
          _duration = event.duration;
          _status = event.status;

          if (_duration.isNegative) {
            SleepTimer.instance.stop();
            _duration = Duration.zero;
          }
        });
      },
    );
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  void _addTime({
    required Duration duration,
    required bool isAdd,
  }) {
    if (_status == SleepTimerStatus.stop) {
      setState(() {
        if (isAdd) {
          _duration += duration;
        } else {
          _duration -= duration;
        }

        if (_duration.isNegative) {
          _duration = Duration.zero;
        }
      });
    } else {
      SleepTimer.instance.stop();
      setState(() {
        if (isAdd) {
          _duration += duration;
        } else {
          _duration -= duration;
        }

        if (_duration.isNegative) {
          _duration = Duration.zero;
        }
      });
      SleepTimer.instance.start(_duration);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 233,
        padding: const EdgeInsets.all(
          Constants.mediumPadding,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _TimeItem(
                  value: AddZero.addZero(_duration.inHours),
                  text: AppLocalizations.of(context)!.hours,
                  addCallback: () {
                    _addTime(
                      duration: const Duration(hours: 1),
                      isAdd: true,
                    );
                  },
                  deleteCallback: () {
                    _addTime(
                      duration: const Duration(hours: 1),
                      isAdd: false,
                    );
                  },
                ),
                const SizedBox(
                  width: Constants.smallPadding,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      ':',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                  ],
                ),
                const SizedBox(
                  width: Constants.smallPadding,
                ),
                _TimeItem(
                  text: AppLocalizations.of(context)!.min,
                  value: AddZero.addZero(
                    _duration.inMinutes - _duration.inHours * 60,
                  ),
                  addCallback: () {
                    _addTime(
                      duration: const Duration(minutes: 1),
                      isAdd: true,
                    );
                  },
                  deleteCallback: () {
                    _addTime(
                      duration: const Duration(minutes: 1),
                      isAdd: false,
                    );
                  },
                ),
                const SizedBox(
                  width: Constants.smallPadding,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      ':',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                  ],
                ),
                const SizedBox(
                  width: Constants.smallPadding,
                ),
                _TimeItem(
                  text: AppLocalizations.of(context)!.sec,
                  value: AddZero.addZero(
                    _duration.inSeconds - _duration.inMinutes * 60,
                  ),
                  isButtons: false,
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: _status == SleepTimerStatus.stop
                      ? Theme.of(context).primaryColor
                      : Colors.red,
                ),
                onPressed: () {
                  if (_status == SleepTimerStatus.stop) {
                    if (_duration != Duration.zero) {
                      SleepTimer.instance.start(_duration);
                    }
                  } else {
                    SleepTimer.instance.stop();
                  }
                },
                child: Text(
                  _status == SleepTimerStatus.stop
                      ? AppLocalizations.of(context)!.start
                      : AppLocalizations.of(context)!.stop,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeItem extends StatelessWidget {
  const _TimeItem({
    required this.text,
    required this.value,
    this.isButtons = true,
    this.addCallback,
    this.deleteCallback,
    Key? key,
  }) : super(key: key);

  final bool isButtons;
  final String text;
  final String value;
  final VoidCallback? addCallback;
  final VoidCallback? deleteCallback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isButtons)
            IconButton(
              splashRadius: 20,
              onPressed: addCallback,
              icon: const Icon(
                Icons.add,
              ),
            ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
          if (isButtons)
            IconButton(
              splashRadius: 20,
              onPressed: deleteCallback,
              icon: const Icon(
                Icons.remove,
              ),
            ),
        ],
      ),
    );
  }
}
