import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/data_models/currency.dart';

Future<List<Currency>> _getCurrencyList() async {
  final String response = await rootBundle.loadString('assets/currency.json');
  final Iterable data = await json.decode(response);
  return List<Currency>.from(data.map((model) => Currency.fromJson(model)));
}

Future<Currency?> selectCurrency(
  BuildContext context,
  Currency? selected,
) async {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container();
    },
  );
}
