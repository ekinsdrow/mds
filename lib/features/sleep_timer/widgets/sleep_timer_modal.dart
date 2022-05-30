import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mds/common/assets/constants.dart';

void showSleepTimerModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return const _SleepTimer();
    },
  );
}

class _SleepTimer extends StatelessWidget {
  const _SleepTimer({Key? key}) : super(key: key);

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
                  text: AppLocalizations.of(context)!.hours,
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
                  isButtons: false,
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //TODO: start timer
                },
                child: Text(
                  AppLocalizations.of(context)!.start,
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
    this.isButtons = true,
    required this.text,
    Key? key,
  }) : super(key: key);

  final bool isButtons;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isButtons)
          IconButton(
            splashRadius: 20,
            onPressed: () {
              //TODO: add time
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        const Text(
          '00',
          style: TextStyle(
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
            onPressed: () {
              //TODO: add time
            },
            icon: const Icon(
              Icons.remove,
            ),
          ),
      ],
    );
  }
}
