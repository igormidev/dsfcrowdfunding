import 'package:flutter/material.dart';

class ContributionFormController extends ChangeNotifier {
  String? _selectedContribution;
  String? get selectedContribution => _selectedContribution;
  set selectedContribution(String? value) {
    _selectedContribution = value;
    notifyListeners();
  }
}
