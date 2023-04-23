import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/domain/const.dart';
import 'package:invoice_app/src/core/presenter/base_bottom_sheet_content.dart';

Future<T?> showBankInfoBS<T>(BuildContext context) =>
    showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        final controller = TextEditingController();
        controller.selection =
            TextSelection.collapsed(offset: controller.text.length);
        final textTheme = Theme.of(context).textTheme;
        return BaseBottomSheetContent(
          child: Form(
            child: Column(
              children: [
                Text(
                  "Bank information",
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Beneficiary name"),
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: spaceBetweenFields),
                TextFormField(
                  decoration: const InputDecoration(labelText: "IBAN"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: spaceBetweenFields),
                TextFormField(
                  decoration: const InputDecoration(labelText: "SWIFT Code"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: spaceBetweenFields),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Bank Name"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: spaceBetweenFields),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Bank Address"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: spaceBetweenFields),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Intermediary SWIFT Code (optional)"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: spaceBetweenFields),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Intermediary Bank Name (optional)"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: spaceBetweenFields),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Intermediary Bank Address (optional)"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: spaceBetweenFields),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Intermediary Account Number (optional)"),
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(controller.text);
                    },
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );


// Pay to banking details below: Beneficiary name: THEODORO LOUREIRO MOTA
// Beneficiary Account Number (IBAN): BR2778632767000010002775141C1
// SWIFT Code: OURIBRSPXXX
// Bank Name: BANCO OURINVEST S.A. Bank Address: Sao Paulo, Brazil
// (Optional) Intermediary bank details: SWIFT Code: SCBLUS33XXX
// Bank Name: STANDARD CHARTERED BANK
// Bank Address: NEW YORK - NY - USA
// Account Number: 3544028150001