import 'dart:convert';

import 'package:homebase_app/model/prize_model.dart';
import 'package:http/http.dart' as http;

Future<PrizeModel> getPrizeApi() async {
  final response =
      await http.get(Uri.parse('https://irfangul92.github.io/index.json'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    return PrizeModel.fromJson(data);
  } else {
    return PrizeModel.fromJson(data);
  }
}
