import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:invoice_app/src/core/di/di.dart';
import 'package:invoice_app/src/core/routes/app_route.gr.dart';
import 'package:invoice_app/src/domain/models/invoice.dart';
import 'package:invoice_app/src/domain/models/invoice_flow_data.dart';
import 'package:invoice_app/src/presentation/utils/share_invoice.dart';
import 'package:invoice_app/src/presentation/add_invoice/add_invoice_navigation_flow.dart';

import 'empty_list.dart';
import 'invoice_list_item.dart';
import 'list_page_viewmodel.dart';

@RoutePage()
class InvoiceListPage extends StatelessWidget {
  InvoiceListPage({Key? key}) : super(key: key);
  final ListPageViewModel _viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Invoice generator",
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
        actions: [
          Visibility(
            visible: true,
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                context.router.push(const SettingsRoute());
              },
            ),
          )
        ],
      ),
      floatingActionButton: Observer(builder: (context) {
        final bool showFab = _viewModel.invoiceList.isNotEmpty;
        return Visibility(
          visible: showFab,
          child: FloatingActionButton.extended(
            label: const Text('New invoice'),
            icon: const Icon(Icons.add),
            onPressed: () {
              _onAddClick(context);
            },
          ),
        );
      }),
      body: Observer(builder: (context) {
        if (_viewModel.invoiceList.isEmpty) {
          return EmptyList(
            onAddClick: () {
              _onAddClick(context);
            },
          );
        } else {
          return ListBody(invoiceList: _viewModel.invoiceList);
        }
      }),
    );
  }

  void _onAddClick(BuildContext context) {
    final navigator = context.router;
    final flow = AddInvoiceNavigationFlow(
      navigator,
      InvoiceFlowData(),
    );
    flow.start();
  }
}

class ListBody extends StatelessWidget {
  const ListBody({super.key, required this.invoiceList});

  final List<Invoice> invoiceList;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return ListView.separated(
      itemCount: invoiceList.length + 1,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Your invoices',
              style: textTheme.headlineMedium!.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }

        index -= 1;

        var invoice = invoiceList[index];
        return InvoiceListItem(
          invoice: invoice,
          onCardClick: () async {
            await getIt<IShareInvoice>().share(invoice);
          },
        );
      },
    );
  }
}
