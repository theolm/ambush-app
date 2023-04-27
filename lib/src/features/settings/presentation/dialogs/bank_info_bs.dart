import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/domain/const.dart';
import 'package:invoice_app/src/core/presenter/base_bottom_sheet_content.dart';
import 'package:invoice_app/src/features/generate_pdf/domain/models/bank_info.dart';

Future<BankInfo?> showBankInfoBS<BankInfo>(
  BuildContext context,
  BankInfo? bankInfo,
) =>
    showModalBottomSheet<BankInfo?>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const _BankBottomSheetContent();
      },
    );

class _BankBottomSheetContent extends StatefulWidget {
  const _BankBottomSheetContent({Key? key}) : super(key: key);

  @override
  State<_BankBottomSheetContent> createState() =>
      _BankBottomSheetContentState();
}

class _BankBottomSheetContentState extends State<_BankBottomSheetContent> {
  final ctlName = TextEditingController();
  final ctlIban = TextEditingController();
  final ctlBankName = TextEditingController();
  final ctlBankAddress = TextEditingController();
  final ctlSwift = TextEditingController();
  final ctlIntIban = TextEditingController();
  final ctlIntBankName = TextEditingController();
  final ctlIntBankAddress = TextEditingController();
  final ctlIntSwift = TextEditingController();

  @override
  void initState() {
    _setupControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              controller: ctlName,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: spaceBetweenFields),
            TextFormField(
              decoration: const InputDecoration(labelText: "IBAN"),
              textInputAction: TextInputAction.next,
              controller: ctlIban,
            ),
            const SizedBox(height: spaceBetweenFields),
            TextFormField(
              decoration: const InputDecoration(labelText: "SWIFT Code"),
              textInputAction: TextInputAction.next,
              controller: ctlSwift,
            ),
            const SizedBox(height: spaceBetweenFields),
            TextFormField(
              decoration: const InputDecoration(labelText: "Bank Name"),
              textInputAction: TextInputAction.next,
              controller: ctlBankName,
            ),
            const SizedBox(height: spaceBetweenFields),
            TextFormField(
              decoration: const InputDecoration(labelText: "Bank Address"),
              textInputAction: TextInputAction.next,
              controller: ctlBankAddress,
            ),
            const SizedBox(height: spaceBetweenFields),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: "Intermediary SWIFT Code (optional)"),
              textInputAction: TextInputAction.next,
              controller: ctlIntSwift,
            ),
            const SizedBox(height: spaceBetweenFields),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: "Intermediary Bank Name (optional)"),
              textInputAction: TextInputAction.next,
              controller: ctlIntBankName,
            ),
            const SizedBox(height: spaceBetweenFields),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: "Intermediary Bank Address (optional)"),
              textInputAction: TextInputAction.next,
              controller: ctlIntBankAddress,
            ),
            const SizedBox(height: spaceBetweenFields),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: "Intermediary Account Number (optional)"),
              textInputAction: TextInputAction.done,
              controller: ctlIntIban,
            ),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(_getBankInfo());
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setupControllers() {
    ctlName.selection = TextSelection.collapsed(offset: ctlName.text.length);

    ctlIban.selection = TextSelection.collapsed(offset: ctlIban.text.length);

    ctlBankName.selection =
        TextSelection.collapsed(offset: ctlBankName.text.length);

    ctlSwift.selection = TextSelection.collapsed(offset: ctlSwift.text.length);

    ctlBankAddress.selection =
        TextSelection.collapsed(offset: ctlBankAddress.text.length);

    ctlIntIban.selection =
        TextSelection.collapsed(offset: ctlIntIban.text.length);

    ctlIntBankName.selection =
        TextSelection.collapsed(offset: ctlIntBankName.text.length);

    ctlIntSwift.selection =
        TextSelection.collapsed(offset: ctlIntSwift.text.length);

    ctlIntBankAddress.selection =
        TextSelection.collapsed(offset: ctlIntBankAddress.text.length);
  }

  BankInfo _getBankInfo() => BankInfo(
        ctlName.text,
        ctlIban.text,
        ctlSwift.text,
        ctlBankName.text,
        ctlBankAddress.text,
        ctlIntSwift.text,
        ctlIntBankName.text,
        ctlIntBankAddress.text,
        ctlIntIban.text,
      );
}
