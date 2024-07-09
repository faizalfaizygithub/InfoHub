import 'package:flutter/material.dart';

class CoinProvider extends ChangeNotifier {
  int selectedPackage = -1;
  List coinPackages = [
    {"count": "7000", "amount": "2500"},
    {"count": "3500", "amount": "1500"},
    {"count": "1500", "amount": "1000"},
    {"count": "750", "amount": "500"},
    {"count": "350", "amount": "250"},
  ];

  selectPackage(index) {
    selectedPackage = index;
    notifyListeners();
  }
}
