import 'package:flutter/material.dart';
import 'package:flutter_sharedpreferences_notifier/screens/home_screen.dart';
import 'package:flutter_sharedpreferences_notifier/util/shared_notifier.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedNotifier().init();
  runApp(const StatelessApp());
}

class StatelessApp extends StatelessWidget {
  const StatelessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: SharedNotifier(),
        ),
      ],
      child: OKToast(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(title: 'Flutter Exploration App'),
        ),
      ),
    );
  }
}
