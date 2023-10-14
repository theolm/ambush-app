import 'package:flutter/material.dart';

class DebugPdf {
  final BuildContext context;

  DebugPdf(this.context);

  Widget getDebugTemplate() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child:
                    _getHeader("Theodoro Loureiro Mota", "43.556.903/0001-66"),
              ),
              const Flexible(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Invoice #1680484",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
          Container(height: 16),
          _getDate("2023-03-27", "2023-03-27"),
          Container(height: 16),
          const Divider(),
          Container(height: 16),
          _getBill("Bill from:", "Theodoro Loureiro Mota",
              "RUA DEROCY PERES DA PALMA, nº 21, Lomba Do Pinheiro. Porto Alegre - RS, Brazil. Zip Code: 91550113"),
          Container(height: 16),
          _getBill("Bill to:", "AMBUSH CONSULTING LLC",
              "7421 Burnet Rd. Suite 276 Austin, TX 78757"),
          Container(height: 16),
          const Row(
            children: [
              Text("Services",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Spacer(),
              Text("Amount",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(),
          Container(height: 8),
          _service(
              "Other services",
              "Software Development Consulting Services - Mar/2023 - Prorated",
              "USD 4,656.52"),
          Container(height: 8),
          const Divider(),
          Container(height: 16),
          _getTotal("USD 4,656.52"),
          Container(height: 32),
          _bankInfo(),
        ],
      ),
    );
  }

  Widget _getHeader(String name, String cnpj) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: const TextStyle(fontSize: 20)),
        Text("CNPJ: $cnpj", style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _getDate(String creation, String due) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "Creation date:",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Container(width: 4),
            Text(
              creation,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "Due date:",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Container(width: 4),
            Text(
              due,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }

  Widget _getBill(
    String header,
    String from,
    String address,
  ) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(
          from, //,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: width / 2,
          child: Text(
            address, //,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
          ),
        )
      ],
    );
  }

  Widget _service(String service, String desription, String amount) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          service,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),
        Row(
          children: [
            Flexible(
              child: Text(
                desription,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              ),
            ),
            Container(width: 4),
            Text(
              amount,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ],
    );
  }

  Widget _getTotal(String amount) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent.shade200,
        borderRadius: const BorderRadius.all(Radius.circular(16))
      ),
      alignment: Alignment.centerRight,
      child: Text(
        amount,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget _bankInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Pay to banking details below:",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Container(height: 8),
        const Row(
          children: [
            Text(
              "Beneficiary name:",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              "Theodoro Loureiro Mota",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        const Row(
          children: [
            Text(
              "Beneficiary Account Number (IBAN):",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              "BR2778632767000010002775141C1",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        const Row(
          children: [
            Text(
              "SWIFT Code:",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              "OURIBRSPXXX",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        const Row(
          children: [
            Text(
              "Bank Name:",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              "BANCO OURINVEST S.A.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        const Row(
          children: [
            Text(
              "Bank Address:",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              "Sao Paulo, Brazil",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ],
    );
  }
}
