import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

class _Result {
  String? result;

  _Result.fromJson(Map<String, dynamic> json) {
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    return data;
  }
}

class Module {
  late String module;
  late String version;

  Module(this.module, this.version);

  Module.fromJson(Map<String, dynamic> json) {
    module = json['module'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['module'] = module;
    data['version'] = version;
    return data;
  }
}

class Python {
  static String result = "";

  Future<String> execute(String filePath) async {
    try {
      await File(filePath).readAsString().then((String contents) async {
        try {
          final response = await http.post(
            Uri.parse('https://pythonfluttercode.herokuapp.com/index.php'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'script': base64Encode(contents.codeUnits),
            }),
          );
          final data = json.decode(response.body);
          var res = _Result.fromJson(data[0]);
          result = res.result ?? "null";
        } catch (e) {
          throw Exception('Error Occured' + e.toString());
        }
      });
      return result;
    } on FileSystemException catch (e) {
      throw Exception("Error : " + e.message);
    }
  }

  Future<void> _installModule() async {
    await http.get(
      Uri.parse('https://pythonfluttercode.herokuapp.com/install.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  Future<void> addModules(List<Module> modules) async {
    for (int i = 0; i <= modules.length - 1; i++) {
      await http.post(
        Uri.parse('https://pythonfluttercode.herokuapp.com/addModules.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'module': modules[i].module,
          'version': modules[i].version,
        }),
      );
    }
    _installModule();
  }

  bool fileExists(String path) {
    late bool exists;
    File(path).exists().then((value) {
      exists = value;
    });
    return exists;
  }
}
