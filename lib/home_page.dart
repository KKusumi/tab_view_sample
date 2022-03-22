import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tab_view_sample/home_tab_page.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TabView Sample"),
            bottom: const TabBar(
              tabs: [
                Tab(text: '1〜15'),
                Tab(text: '16〜30'),
                Tab(text: '31〜45'),
                Tab(text: '46〜60'),
                Tab(text: '61〜75'),
              ],
            )
        ),
        body: const TabBarView(
          children: [
            HomeTabPage(index: 0),
            HomeTabPage(index: 1),
            HomeTabPage(index: 2),
            HomeTabPage(index: 3),
            HomeTabPage(index: 4),
          ],
        ),
      ),
    );
  }
}
