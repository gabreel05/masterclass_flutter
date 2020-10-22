import 'package:flutter/material.dart';
import 'package:masterclass/screens/signup_screen.dart';
import 'package:masterclass/stores/app_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppStore>.value(
          value: AppStore(),
        ),
      ],
      child: MaterialApp(
        title: 'MasterClass',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SignupScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
