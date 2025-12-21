import 'package:flutter/material.dart';

class Card {
  Card({
    required this.name,
    required this.barCode,
    required this.qrCode,
    this.balance
  });

  String name;
  Image barCode;
  Image qrCode;
  String? balance;

  void qrChange() {

  }

  @override
  String toString() {
    return 'Карта $name, QR: $qrCode, BAR: $barCode' ;
  }


}