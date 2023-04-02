import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:template_flutter/src/core/di/di.dart';
import 'package:template_flutter/src/features/demo_feature/presentation/demo_viewmodel.dart';

class DemoPage extends StatelessWidget {
  DemoPage({super.key});

  final DemoViewModel viewmodel = getIt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SchemeColorBox(
                label: 'Primary',
                color: Theme.of(context).colorScheme.primary,
              ),
              SchemeColorBox(
                label: 'Secondary',
                color: Theme.of(context).colorScheme.secondary,
              ),
              SchemeColorBox(
                label: 'Tertiary',
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ],
          ),
          Container(height: 32),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Observer(builder: (context) {
                  return Text(
                    '${viewmodel.count}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }),
              ],
            ),
          ),
          Container(height: 64),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewmodel.incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
    ;
  }
}

class SchemeColorBox extends StatelessWidget {
  final String label;
  final Color color;

  const SchemeColorBox({
    Key? key,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(label),
            Container(
              color: color,
              height: 40,
              width: 40,
            ),
          ],
        ),
      ),
    );
  }
}
