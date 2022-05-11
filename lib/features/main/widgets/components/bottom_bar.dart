import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mds/common/assets/constants.dart';
import 'package:mds/features/app/router/router.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    required this.activeIndex,
    required this.callback,
    Key? key,
  }) : super(key: key);

  final int activeIndex;
  final Function(int index) callback;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  bool player = true;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (player)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _PlayerWidget(),
                SizedBox(
                  height: Constants.smallPadding,
                ),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Item(
                icon: Icons.home,
                active: widget.activeIndex == 0,
                callback: () {
                  widget.callback(0);
                },
              ),
              _Item(
                icon: Icons.settings,
                active: widget.activeIndex == 1,
                callback: () {
                  widget.callback(1);
                },
              ),
              _Item(
                icon: Icons.info,
                active: widget.activeIndex == 2,
                callback: () {
                  widget.callback(2);
                },
              ),
            ],
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

class _PlayerWidget extends StatelessWidget {
  const _PlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(
        Constants.borderRadius,
      ),
      color: Theme.of(context).splashColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(
          Constants.borderRadius,
        ),
        onTap: () {
          context.router.push(
            const PlayerRoute(),
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.smallPadding,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Title - Author',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
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
                      IconButton(
                        onPressed: () {
                          //TODO: play
                        },
                        splashRadius: 20,
                        icon: const Icon(
                          Icons.play_arrow,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              //TODO: progress bar
              Stack(
                children: [
                  Container(
                    height: 5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        Constants.borderRadius,
                      ),
                    ),
                  ),
                  Container(
                    height: 5,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(
                        Constants.borderRadius,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: Constants.smallPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
