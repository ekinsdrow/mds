import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mds/common/assets/constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(
          Constants.mediumPadding,
        ),
        child: Column(
          children: [
            //TODO: settings
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //TODO: remove all downloaded files
                },
                child: Text(
                  AppLocalizations.of(context)!.remove_all_downloaded_files,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
