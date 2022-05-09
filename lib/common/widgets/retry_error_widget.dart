import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mds/common/assets/constants.dart';
import 'package:mds/common/extensions/exeption_util.dart';

class RetryErrorWidget extends StatelessWidget {
  const RetryErrorWidget({
    Key? key,
    required this.error,
    required this.callback,
  }) : super(key: key);

  final Exception error;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          error.toExceptionString(
            context,
          ),
        ),
        const SizedBox(
          height: Constants.smallPadding,
        ),
        ElevatedButton(
          onPressed: callback,
          child: Text(
            AppLocalizations.of(context)!.retry,
          ),
        ),
      ],
    );
  }
}
