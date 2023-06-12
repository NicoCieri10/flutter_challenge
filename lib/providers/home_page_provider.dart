import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _search = '';
  String get search => _search;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set search(String value) {
    _search = value;
    notifyListeners();
  }

  TextEditingController? searchEditingController() {
    TextEditingController? editingController = TextEditingController();

    editingController.value = TextEditingValue(
      text: _search,
      selection: TextSelection.fromPosition(
        TextPosition(offset: _search.length),
      ),
    );

    return editingController;
  }
}
