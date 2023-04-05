import 'package:flutter/material.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/features/generate_pdf/domain/usecases/generate_invoice.dart';


class InvoiceListPage extends StatelessWidget {
  const InvoiceListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Invoice Generator"), //TODO: isloate strings in local.
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () async{
          await savePdf();
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        itemCount: 100,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        separatorBuilder: (_, __) => Container(
          height: 1,
          width: double.infinity,
          color: Colors.black,
        ),
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            alignment: Alignment.centerLeft,
            child: Text("Invoice $index"),
          );
        },
      ),
    );
  }

  Future<void> savePdf() async {
    var useCase = getIt<IGenerateInvoiceUseCase>();
    await useCase.createAndSave();
  }
}
