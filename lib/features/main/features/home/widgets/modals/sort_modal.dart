import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mds/common/assets/constants.dart';
import 'package:mds/features/app/data/enums/sort_enums.dart';
import 'package:mds/features/app/data/notifiers/catalog_notifier.dart';
import 'package:provider/provider.dart';

void showSortModal(
  BuildContext context,
) {
  final catalogProvider = context.read<CatalogNotifier>();

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => ChangeNotifierProvider.value(
      value: catalogProvider,
      child: const _FilterModal(),
    ),
  );
}

class _FilterModal extends StatelessWidget {
  const _FilterModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 400,
        padding: const EdgeInsets.symmetric(
          vertical: Constants.mediumPadding,
        ),
        width: double.infinity,
        child: Column(
          children: const [
            _AscDesc(),
            Expanded(
              child: _Types(),
            ),
          ],
        ),
      ),
    );
  }
}

class _AscDesc extends StatelessWidget {
  const _AscDesc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Constants.mediumPadding,
      ),
      child: Row(
        children: [
          Expanded(
            child: _AscDeskItem(
              choosen: context.watch<CatalogNotifier>().sortDirection ==
                  SortDirections.asc,
              type: _AscDeskItemType.left,
              text: AppLocalizations.of(context)!.ascending,
              sortDirection: SortDirections.asc,
            ),
          ),
          Expanded(
            child: _AscDeskItem(
              choosen: context.watch<CatalogNotifier>().sortDirection ==
                  SortDirections.desc,
              type: _AscDeskItemType.right,
              text: AppLocalizations.of(context)!.descending,
              sortDirection: SortDirections.desc,
            ),
          ),
        ],
      ),
    );
  }
}

enum _AscDeskItemType {
  left,
  right,
}

class _AscDeskItem extends StatelessWidget {
  const _AscDeskItem({
    Key? key,
    required this.choosen,
    required this.type,
    required this.text,
    required this.sortDirection,
  }) : super(key: key);

  final bool choosen;
  final _AscDeskItemType type;
  final String text;
  final SortDirections sortDirection;

  @override
  Widget build(BuildContext context) {
    final borderRadius = type == _AscDeskItemType.left
        ? const BorderRadius.only(
            topLeft: Radius.circular(
              Constants.borderRadius,
            ),
            bottomLeft: Radius.circular(
              Constants.borderRadius,
            ),
          )
        : const BorderRadius.only(
            topRight: Radius.circular(
              Constants.borderRadius,
            ),
            bottomRight: Radius.circular(
              Constants.borderRadius,
            ),
          );

    return Material(
      borderRadius: borderRadius,
      color: choosen ? Theme.of(context).primaryColor : Colors.transparent,
      child: InkWell(
        onTap: () {
          context.read<CatalogNotifier>().changeSortDirection(sortDirection);
        },
        borderRadius: borderRadius,
        child: Container(
          padding: const EdgeInsets.all(
            Constants.smallPadding,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
            borderRadius: borderRadius,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: choosen ? Colors.white : Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

class _Types extends StatelessWidget {
  const _Types({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        _Item(
          text: AppLocalizations.of(context)!.by_name,
          choosed: context.watch<CatalogNotifier>().sortType == SortTypes.name,
          sortType: SortTypes.name,
        ),
        _Item(
          text: AppLocalizations.of(context)!.by_author,
          choosed:
              context.watch<CatalogNotifier>().sortType == SortTypes.author,
          sortType: SortTypes.author,
        ),
        _Item(
          text: AppLocalizations.of(context)!.by_duration,
          choosed:
              context.watch<CatalogNotifier>().sortType == SortTypes.duration,
          sortType: SortTypes.duration,
        ),
        _Item(
          text: AppLocalizations.of(context)!.by_year_of_issue,
          choosed: context.watch<CatalogNotifier>().sortType == SortTypes.date,
          sortType: SortTypes.date,
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.text,
    required this.choosed,
    required this.sortType,
  }) : super(key: key);

  final String text;
  final bool choosed;
  final SortTypes sortType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CatalogNotifier>().changeSortType(sortType);
      },
      child: Container(
        padding: const EdgeInsets.all(
          Constants.mediumPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            IgnorePointer(
              child: Checkbox(
                value: choosed,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (v) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
