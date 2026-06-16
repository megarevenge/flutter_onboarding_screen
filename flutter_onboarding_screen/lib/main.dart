import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/components/onboarding_screen.dart';
import 'package:flutter_onboarding_screen/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatefulWidget {

  final bool showHome;

  const MyApp({super.key, required this.showHome});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding Screen',
      home: widget.showHome ? HomePage() : OnboardingScreen(),
    );
  }
}
