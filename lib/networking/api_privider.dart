import 'dart:convert';

import 'package:bhart_app/networking/network_constant.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  String authToken =
      '\$2y\$10\$6y7rX3ImTQUeZhk24lfjkObnOVqa4Y/crkJVybErTK8CX2UXLRVEq';
  Future<dynamic> getMethod({required String routeUrl}) async {
    var res = await http.get(
      Uri.parse(NetworkConstant.BASE_URL + routeUrl),
      headers: {
        "Content-Type": "application/json",
        'X-Auth-Token': ' $authToken'
      },
    );
    if (res.statusCode == 200) {
      return json.decode(res.body);
    } else {
      return 'error';
    }
  }
}
