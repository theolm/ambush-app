import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/presenter/components/dialog_one_button.dart';
import 'package:invoice_app/src/core/presenter/routes/app_route.gr.dart';

import 'list_page_viewmodel.dart';

@RoutePage()
class InvoiceListPage extends StatelessWidget {
  InvoiceListPage({Key? key}) : super(key: key);
  final ListPageViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice Generator"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.router.push(const SettingsRoute());
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () async {
          context.router.push(AddInvoiceRoute());
        },
        child: const Icon(Icons.add),
      ),
      body: Observer(builder: (context) {
        return ListView.separated(
          itemCount: _viewModel.invoiceList.length,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          separatorBuilder: (_, __) => Container(
            height: 1,
            width: double.infinity,
            color: Colors.black,
          ),
          itemBuilder: (context, index) {
            var invoice = _viewModel.invoiceList[index];
            return Container(
              height: 50,
              alignment: Alignment.centerLeft,
              child: Text("Invoice Id: ${invoice.id}"),
            );
          },
        );
      }),
    );
  }

  void showErrorDialog(BuildContext context) => showDialog<void>(
        context: context,
        builder: (BuildContext context) => DialogOneButton(
          title: 'Title',
          supportText: 'Testing dialog',
          button: DialogButton('Button', () {}),
        ),
      );
}
