import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tab_view_sample/home_use_case.dart';

final homeTabViewModelNotifierProvider =
    ChangeNotifierProvider.family<HomeTabViewModel, int>(
        (ref, id) => HomeTabViewModel(ref.read, id));

class HomeTabViewModel extends ChangeNotifier {
  final Reader _reader;
  final int index;
  late final HomeUseCase _homeUseCase = _reader(homeUseCaseProvider);

  HomeTabViewModel(this._reader, this.index);

  List<String>? _list;

  List<String>? get list => _list;

  Future<void> fetchData(int index) async {
    _list = await _homeUseCase.execute(index);
    notifyListeners();
  }
}
