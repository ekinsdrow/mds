import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mds/common/assets/constants.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/common/data/models/records.dart';
import 'package:mds/common/extensions/date_extension.dart';
import 'package:mds/common/extensions/duration_extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _Header(),
          SizedBox(
            height: Constants.mediumPadding,
          ),
          _Filters(),
          SizedBox(
            height: Constants.smallPadding,
          ),
          _Records(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.mediumPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.catalog,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          IconButton(
            splashRadius: 20,
            onPressed: () {
              //TODO: search
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
    );
  }
}

class _Filters extends StatelessWidget {
  const _Filters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.mediumPadding,
      ),
      height: 40,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          //TODO: localization and tap
          _FilterCard(
            text: 'Favorites',
            callback: () {
              //TODO: create filter
            },
          ),
          const SizedBox(
            width: Constants.smallPadding,
          ),
          _FilterCard(
            text: 'Dowloaded',
            callback: () {
              //TODO: create filter
            },
          ),
          const SizedBox(
            width: Constants.smallPadding,
          ),
          _FilterCard(
            text: 'Other filtres',
            callback: () {
              //TODO: open filters
            },
          ),
        ],
      ),
    );
  }
}

class _FilterCard extends StatelessWidget {
  const _FilterCard({
    Key? key,
    required this.text,
    required this.callback,
  }) : super(key: key);

  final String text;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Constants.borderRadius * 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            offset: const Offset(
              0,
              2,
            ),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(
          Constants.borderRadius * 2,
        ),
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: callback,
          borderRadius: BorderRadius.circular(
            Constants.borderRadius * 2,
          ),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.mediumPadding,
            ),
            height: 40,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Records extends StatelessWidget {
  const _Records({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: Constants.smallPadding,
        ),
        itemBuilder: (context, index) => _Item(
          record: context.read<Records>().records[index],
        ),
        itemCount: context.read<Records>().records.length,
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.record,
    Key? key,
  }) : super(key: key);

  final Record record;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        Constants.borderRadius * 2,
      ),
      onTap: () {
        //TODO: tap
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Constants.mediumPadding,
          horizontal: Constants.smallPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  record.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  record.authorsString,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      record.file.duration.format(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${int.parse(record.file.size) ~/ 1024}Mb',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      record.date.formatDate(),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    //TODO:add to fav
                  },
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.favorite,
                  ),
                ),
                const Icon(
                  Icons.play_arrow,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
