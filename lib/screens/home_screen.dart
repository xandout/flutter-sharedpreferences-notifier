import 'package:flutter/material.dart';
import 'package:flutter_sharedpreferences_notifier/screens/moose_counter.dart';
import 'package:flutter_sharedpreferences_notifier/util/shared_notifier.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<SharedNotifier>(context).getInt('counter');
    return SafeArea(
      child: Container(
        color: Colors.grey,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Expo'),
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MooseCounter(
                              title: 'Moose Counter',
                            ),
                          ),
                        );
                      },
                      child: const Text('Go To Moose Counter'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('$counter'),
                          const Text(' meese discovered'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
