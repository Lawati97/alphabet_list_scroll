import 'dart:math';
import 'package:flutter/material.dart';
import 'package:alphabet_list_scroll/alphabet_list_scroll.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> randomString = [];
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  void initState() {
    for (int i = 0; i < 100; i++) {
      String string = getRandomString(5);
      randomString.add(string);
    }
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    Size layoutSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Alphabet List Example'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: layoutSize.height * 0.05),
        child: AlphabetListScrollView(
            showPreview: true,
            useVibration: false,
            keyboardUsage: true,
            headerWidgetList: [],
            highlightTextStyle:
                Theme.of(context).primaryTextTheme.headline1!.copyWith(
                      fontSize: layoutSize.width * 0.04,
                      color: Colors.red,
                    ),
            normalTextStyle: Theme.of(context).textTheme.headline3!.copyWith(
                  fontSize: layoutSize.width * 0.03,
                  color: Colors.black,
                ),
            strList: randomString,
            indexedHeight: (i) {
              return layoutSize.height * 0.11;
            },
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () => print(index),
                title: Text(
                  randomString[index],
                  textScaleFactor: 1,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontSize: layoutSize.width * 0.042,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
                leading: CircleAvatar(
                  radius: layoutSize.width * 0.1,
                  backgroundColor: Colors.grey,
                  child: Text(
                    (randomString[index])[0].toUpperCase(),
                    textScaleFactor: 1,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontSize: layoutSize.height * 0.03,
                        ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
