import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mds/common/assets/constants.dart';
import 'package:mds/common/data/models/record.dart';
import 'package:mds/common/data/models/records.dart';
import 'package:mds/features/app/router/router.dart';
import 'package:mds/features/main/widgets/components/bottom_bar.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
    required this.records,
  }) : super(key: key);

  final List<Record> records;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => Records(
        records: records,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Builder(
              builder: (context) {
                return AutoTabsRouter(
                  routes: const [
                    HomeRouter(),
                    SettingsRouter(),
                    InfoRouter(),
                  ],
                  builder: (context, child, _) {
                    final tabsRouter = AutoTabsRouter.of(context);

                    return Stack(
                      children: [
                        child,
                        Positioned(
                          bottom: 0,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Constants.smallPadding,
                              horizontal: Constants.mediumPadding - 5,
                            ),
                            child: BottomBar(
                              activeIndex: tabsRouter.activeIndex,
                              callback: (index) {
                                tabsRouter.setActiveIndex(index);
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
