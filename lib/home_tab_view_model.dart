import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tab_view_sample/home_use_case.dart';

final homeTabViewModelNotifierProvider =
    ChangeNotifierProvider((ref) => HomeTabViewModel(ref.read));

class HomeTabViewModel extends ChangeNotifier {
  final Reader _reader;
  late final HomeUseCase _homeUseCase = _reader(homeUseCaseProvider);

  HomeTabViewModel(this._reader);

  List<String>? _list;

  List<String>? get list => _list;

  Future<void> fetchData(int index) async {
    _list = await _homeUseCase.execute(index);
    notifyListeners();
  }
}
