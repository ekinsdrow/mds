import 'package:flutter/material.dart';
import 'package:mds/common/assets/constants.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    required this.activeIndex,
    required this.callback,
    Key? key,
  }) : super(key: key);

  final int activeIndex;
  final Function(int index) callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        Constants.smallPadding,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(
          Constants.borderRadius * 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            offset: const Offset(
              0,
              2,
            ),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _Item(
            icon: Icons.home,
            active: activeIndex == 0,
            callback: () {
              callback(0);
            },
          ),
          _Item(
            icon: Icons.settings,
            active: activeIndex == 1,
            callback: () {
              callback(1);
            },
          ),
          _Item(
            icon: Icons.info,
            active: activeIndex == 2,
            callback: () {
              callback(2);
            },
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.icon,
    required this.active,
    required this.callback,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final bool active;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(
            Constants.borderRadius,
          ),
          onTap: callback,
          child: Container(
            padding: const EdgeInsets.all(
              Constants.smallPadding,
            ),
            child: Icon(
              icon,
              color: active
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
          ),
        ),
      ),
    );
  }
}
