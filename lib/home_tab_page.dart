import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tab_view_sample/home_tab_view_model.dart';

class HomeTabPage extends HookConsumerWidget {
  final int index;

  const HomeTabPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(homeTabViewModelNotifierProvider);
    final list = ref
        .watch(homeTabViewModelNotifierProvider.select((value) => value.list));

    useEffect(() {
      viewModel.fetchData(index);
      return;
    }, []);

    return list != null
        ? ListView.separated(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Container(
                  alignment: Alignment.centerLeft,
                  height: 56,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                      list[index],
                    style: const TextStyle(
                      fontSize: 18
                    ),
                  )
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(height: 1, color: Colors.black);
            },
          )
        : const SizedBox();
  }
}
