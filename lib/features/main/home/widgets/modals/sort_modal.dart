import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mds/common/assets/constants.dart';

void showSortModal(
  BuildContext context,
) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => const _FilterModal(),
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
              choosen: true,
              type: _AscDeskItemType.left,
              text: AppLocalizations.of(context)!.ascending,
            ),
          ),
          Expanded(
            child: _AscDeskItem(
              choosen: false,
              type: _AscDeskItemType.right,
              text: AppLocalizations.of(context)!.descending,
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
  }) : super(key: key);

  final bool choosen;
  final _AscDeskItemType type;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        Constants.smallPadding,
      ),
      decoration: BoxDecoration(
        color: choosen ? Theme.of(context).primaryColor : Colors.transparent,
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1,
        ),
        borderRadius: type == _AscDeskItemType.left
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
              ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: choosen ? Colors.white : Theme.of(context).primaryColor,
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
          choosed: true,
        ),
        _Item(
          text: AppLocalizations.of(context)!.by_author,
        ),
        _Item(
          text: AppLocalizations.of(context)!.by_duration,
        ),
        _Item(
          text: AppLocalizations.of(context)!.by_year_of_issue,
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.text,
    this.choosed = false,
  }) : super(key: key);

  final String text;
  final bool choosed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO: change sorting
      },
      child: Container(
        padding: const EdgeInsets.all(
          Constants.mediumPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            Checkbox(
              value: choosed,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: (v) {},
            ),
          ],
        ),
      ),
    );
  }
}
