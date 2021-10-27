import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goals/views/screens/home_screen.dart';
import 'package:goals/views/utils/app_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Goals',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppStyles.backgroundColor,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
      },
    );
  }
}
