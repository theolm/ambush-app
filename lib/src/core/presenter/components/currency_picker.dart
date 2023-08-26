import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice_app/src/core/domain/const.dart';
import 'package:invoice_app/src/domain/models/currency.dart';


Future<List<Currency>> getCurrencyList() async {
  final String response = await rootBundle.loadString('assets/currency.json');
  final Iterable data = await json.decode(response);
  return List<Currency>.from(data.map((model) => Currency.fromJson(model)));
}

Future<Currency?> selectCurrency(
  BuildContext context,
  List<Currency> currencyList,
  String? selectedCC,
) async {
  final textTheme = Theme.of(context).textTheme;
  final colors = Theme.of(context).colorScheme;
  final selectedTheme = textTheme.titleLarge?.copyWith(
    color: colors.surfaceTint,
    fontWeight: FontWeight.w800,
  );

  return showModalBottomSheet<Currency?>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: regularMargin,
          horizontal: regularMargin,
        ),
        itemBuilder: (_, pos) {
          var currency = currencyList[pos];
          var isSelected = currency.cc == selectedCC;
          var style = isSelected ? selectedTheme : textTheme.titleSmall;

          return ListTile(
            title: Text(
              currency.name,
              style: style,
            ),
            trailing: Text(
              currency.cc,
              style: style,
            ),
            onTap: () {
              Navigator.pop(context, currency);
            },
          );
        },
        itemCount: currencyList.length,
      );
    },
  );
}
