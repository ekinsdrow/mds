import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mds/common/assets/constants.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/common/widgets/progress_bar.dart';
import 'package:mds/common/widgets/record_list_item.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            _Header(),
            Expanded(
              child: Queue(),
            ),
            SizedBox(
              height: Constants.mediumPadding,
            ),
            _Actions(),
          ],
        ),
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
        horizontal: Constants.smallPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            splashRadius: 20,
            onPressed: () {
              context.router.pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Row(
            children: [
              Container(
                width: 40,
              ),
              Text(
                'Title',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                splashRadius: 20,
                onPressed: () {
                  //TODO: download
                },
                icon: Icon(
                  Icons.cloud_download,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              IconButton(
                splashRadius: 20,
                onPressed: () {
                  //TODO: add to fav
                },
                icon: Icon(
                  Icons.favorite,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//TODO: now playing queue
class Queue extends StatelessWidget {
  const Queue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(
        left: Constants.smallPadding,
        right: Constants.smallPadding,
      ),
      itemBuilder: (context, index) => RecordListItem(
        record: Record.placeholder(),
        active: index == 2,
      ),
      itemCount: 100,
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: Constants.mediumPadding,
        right: Constants.mediumPadding,
        bottom: Constants.mediumPadding,
      ),
      child: Column(
        children: const [
          _ProgressBar(),
          SizedBox(
            height: Constants.bigPadding,
          ),
          _Buttons(),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProgressBar(),
        const SizedBox(
          height: Constants.smallPadding,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              '00:50:00',
            ),
            Text(
              '01:40:00',
            ),
          ],
        ),
      ],
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          splashRadius: 20,
          onPressed: () {
            //TODO: add to fav
          },
          icon: const Icon(
            Icons.info,
            color: Colors.black54,
          ),
        ),
        IconButton(
          splashRadius: 20,
          onPressed: () {
            //TODO: prev track
          },
          icon: Icon(
            Icons.skip_previous,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Material(
          borderRadius: BorderRadius.circular(
            Constants.borderRadius * 1.5,
          ),
          color: Theme.of(context).primaryColor,
          child: InkWell(
            onTap: () {
              //TODO: pause
            },
            borderRadius: BorderRadius.circular(
              Constants.borderRadius * 1.5,
            ),
            child: Container(
              width: 60,
              height: 60,
              child: const Icon(
                Icons.pause,
                color: Colors.white,
              ),
            ),
          ),
        ),
        IconButton(
          splashRadius: 20,
          onPressed: () {
            //TODO: next track
          },
          icon: Icon(
            Icons.skip_next,
            color: Theme.of(context).primaryColor,
          ),
        ),
        IconButton(
          splashRadius: 20,
          onPressed: () {
            //TODO: open sleep timer
          },
          icon: const Icon(
            Icons.timer,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
