import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mds/common/assets/constants.dart';
import 'package:mds/common/assets/images/resources.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(Constants.mediumPadding),
        child: ListView(
          children: [
            Text(
              AppLocalizations.of(context)!.develop,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: Constants.smallPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'App developed by Ivan Kolchev',
                ),
                Material(
                  child: InkWell(
                    onTap: () {
                      launchUrl(
                        Uri.parse(
                          'https://t.me/ekinsdrow',
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      color: Colors.transparent,
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        SvgPath.telegramLogo,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: Constants.mediumPadding,
            ),
            Text(
              AppLocalizations.of(context)!.about_app,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: Constants.smallPadding,
            ),
            //TODO: change text
            Text(
              'Lorem ipsum dolor sit amet ' + 'ipsum dolor sit amet' * 1000,
            ),
          ],
        ),
      ),
    );
  }
}
