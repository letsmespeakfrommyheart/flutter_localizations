// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en', '');

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ru', ''),
        const Locale('fr', ''),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomeWidget(),
      },
    );
  }
}

class MyHomeWidget extends StatefulWidget {
  const MyHomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomeWidget> createState() => _MyHomeWidgetState();
}

class _MyHomeWidgetState extends State<MyHomeWidget> {
  @override
  Widget build(BuildContext context) {
    var translation = AppLocalizations.of(context)!;
    DateTime dateWinnie = DateTime.parse("2022-06-01");
    DateTime dateRabbit = DateTime.parse("2022-05-02");
    DateTime datePig = DateTime.parse("2022-05-19");
    return Scaffold(
      appBar: AppBar(
        title: Text(translation.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton.extended(
                  onPressed: () {}, label: Text("English")),
              FloatingActionButton.extended(
                  onPressed: () {}, label: Text("Русский")),
              FloatingActionButton.extended(
                  onPressed: () {}, label: Text("Français"))
            ],
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.network(
                        'https://slovnet.ru/wp-content/uploads/2018/11/1-11.png'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translation.winnieName,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(translation.purchase(dateWinnie)),
                      Text(translation.honey(2) +
                          " " +
                          translation.manufacturer("'Meadow Honey'")),
                      Text(translation.total(100))
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.network(
                        'https://wikiimg.tojsiabtv.com/wikipedia/en/thumb/e/e9/Rabbitpooh.jpg/640px-Rabbitpooh.jpg'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translation.rabbitName,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(translation.purchase(dateRabbit)),
                      Text(translation.honey(10) +
                          " " +
                          translation.manufacturer("'Buckwheat Honey'")),
                      Text(translation.total(500))
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/ru/d/dd/Pigletdisney.jpg'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translation.pigName,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(translation.purchase(datePig)),
                      Text(translation.honey(1) +
                          " " +
                          translation.manufacturer("'Flower Honey'")),
                      Text(translation.total(50))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
