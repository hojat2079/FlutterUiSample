import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class DataService {
  Future<List<dynamic>> getUsers() async {
    var info = rootBundle.loadString('json/data.json');
    var list = json.decode(await info);
    return Future.delayed(const Duration(seconds: 2)).then((value) => list);
  }
}
