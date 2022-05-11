import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mds/common/assets/constants.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/common/extensions/date_extension.dart';
import 'package:mds/common/extensions/duration_extension.dart';
import 'package:mds/features/main/blocs/favorites/favorites_bloc.dart';
import 'package:mds/features/main/data/notifiers/catalog_notifier.dart';
import 'package:mds/features/main/features/home/widgets/modals/sort_modal.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: Constants.mediumPadding,
          ),
          _Header(),
          SizedBox(
            height: Constants.mediumPadding,
          ),
          _Filters(),
          _Records(),
        ],
      ),
    );
  }
}

class _Header extends StatefulWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  bool _searchOpen = false;

  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _searchController.addListener(
      () {
        context.read<CatalogNotifier>().search(
              _searchController.text,
            );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.mediumPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!_searchOpen)
            Text(
              AppLocalizations.of(context)!.catalog,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          if (_searchOpen)
            Expanded(
              child: SizedBox(
                height: 48,
                child: TextField(
                  autofocus: true,
                  controller: _searchController,
                ),
              ),
            ),
          IconButton(
            splashRadius: 20,
            onPressed: () {
              setState(() {
                _searchOpen = !_searchOpen;

                if (!_searchOpen) {
                  context.read<CatalogNotifier>().clearSearch();
                } else {
                  _searchController.clear();
                }
              });
            },
            icon: Icon(
              !_searchOpen ? Icons.search : Icons.close,
            ),
          ),
        ],
      ),
    );
  }
}

class _Filters extends StatelessWidget {
  const _Filters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        padding: const EdgeInsets.only(
          left: Constants.mediumPadding,
          right: Constants.mediumPadding,
          bottom: Constants.mediumPadding,
        ),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          _FilterCard(
            text: AppLocalizations.of(context)!.favorites,
            callback: () {
              context.read<CatalogNotifier>().toogleShowOnlyFav();
            },
            active: context.watch<CatalogNotifier>().showOnlyFav,
          ),
          const SizedBox(
            width: Constants.smallPadding,
          ),
          _FilterCard(
            text: AppLocalizations.of(context)!.dowloaded,
            callback: () {
              //TODO: create filter
            },
            active: false,
          ),
          const SizedBox(
            width: Constants.smallPadding,
          ),
          _FilterCard(
            text: AppLocalizations.of(context)!.recently_listening,
            callback: () {
              //TODO: recently listneng filter
            },
            active: false,
          ),
          Row(
            children: [
              const SizedBox(
                width: Constants.smallPadding,
              ),
              _FilterCard(
                text: AppLocalizations.of(context)!.sorting,
                callback: () {
                  showSortModal(context);
                },
                active: true,
              ),
            ],
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
    required this.active,
  }) : super(key: key);

  final String text;
  final VoidCallback callback;
  final bool active;

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
        color: active ? Theme.of(context).primaryColor : Colors.white,
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
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(
                Constants.borderRadius * 2,
              ),
            ),
            height: 40,
            child: Text(
              text,
              style: TextStyle(
                color: !active ? Theme.of(context).primaryColor : Colors.white,
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
        padding: const EdgeInsets.only(
          left: Constants.smallPadding,
          right: Constants.smallPadding,
          bottom: 150,
        ),
        itemBuilder: (context, index) => _Item(
          record: context.watch<CatalogNotifier>().nowList[index],
        ),
        itemCount: context.watch<CatalogNotifier>().nowList.length,
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
                    if (record.isFavorite) {
                      context.read<FavoritesBloc>().add(
                            FavoritesEvent.delete(
                              id: record.recordId,
                            ),
                          );
                    } else {
                      context.read<FavoritesBloc>().add(
                            FavoritesEvent.save(
                              id: record.recordId,
                            ),
                          );
                    }
                  },
                  splashRadius: 20,
                  icon: Icon(
                    record.isFavorite ? Icons.favorite : Icons.favorite_border,
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
