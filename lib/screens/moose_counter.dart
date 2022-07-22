import 'package:flutter/material.dart';
import 'package:flutter_sharedpreferences_notifier/util/shared_notifier.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

class MooseCounter extends StatefulWidget {
  const MooseCounter({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MooseCounter> createState() => _MooseCounterState();
}

class _MooseCounterState extends State<MooseCounter> {
  void _incrementCounter(BuildContext context) {
    var count =
        Provider.of<SharedNotifier>(context, listen: false).getInt('counter');
    Provider.of<SharedNotifier>(context, listen: false)
        .setInt('counter', count != null ? count + 1 : 0);
  }

  @override
  Widget build(BuildContext context) {
    var counterVal = Provider.of<SharedNotifier>(context).getInt('counter');
    return Scaffold(
      appBar: AppBar(
        title: Text('$counterVal - ${widget.title}'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have found many a moose:',
            ),
            Text(
              '$counterVal',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {
                showToast(
                  '$counterVal',
                  position: ToastPosition.bottom,
                );
              },
              child: const Text('Toast the mooses'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: (() {
          _incrementCounter(context);
        }),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
