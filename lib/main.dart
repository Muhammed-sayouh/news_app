import 'package:flutter/material.dart';
import 'package:news_app/helpers/porviders.dart';
import 'package:news_app/ui/screens/home/home_screen.dart';
import 'package:news_app/ui/theme/style/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: providers,
      child: MaterialApp(
        home: const HomeScreen(),
        theme: getTheme(),
      ),
    );
  }
}
