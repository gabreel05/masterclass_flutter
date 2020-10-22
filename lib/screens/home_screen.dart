import 'package:flutter/material.dart';
import 'package:masterclass/stores/app_store.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Image.network(store.picture),
                Text(store.name),
                Text(store.email),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
