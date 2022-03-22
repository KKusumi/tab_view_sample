import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tab_view_sample/home_tab_view_model.dart';

class HomeTabPage extends StatefulHookConsumerWidget {
  final int index;

  const HomeTabPage({Key? key, required this.index}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends ConsumerState<HomeTabPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final viewModel = ref.read(homeTabViewModelNotifierProvider(widget.index));
    final list = ref.watch(homeTabViewModelNotifierProvider(widget.index)
        .select((value) => value.list));

    useEffect(() {
      viewModel.fetchData(widget.index);
      return;
    }, []);

    return list != null
        ? ListView.separated(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Container(
                  alignment: Alignment.centerLeft,
                  height: 56,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    list[index],
                    style: const TextStyle(fontSize: 18),
                  ));
            },
            separatorBuilder: (context, index) {
              return const Divider(height: 1, color: Colors.black);
            },
          )
        : const SizedBox();
  }
}
