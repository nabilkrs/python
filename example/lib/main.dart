import 'package:flutter/material.dart';
import 'package:python/python.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Python pythonScript = Python();
  String pythonCodeResult = "";
  List<Module> modules = [Module("Flask", "2.1.2")];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Python Plugin example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(pythonCodeResult),
              TextButton(
                child: const Text("Execute Python Code"),
                onPressed: () async {
                  await pythonScript
                      .execute('lib/helloWorld.py')
                      .then((result) async {
                    setState(() {
                      pythonCodeResult = result;
                    });
                  });
                },
              ),
              TextButton(
                  onPressed: () async {
                    await pythonScript.addModules(modules);
                  },
                  child: const Text("Add Module")),
            ],
          ),
        ));
  }
}
