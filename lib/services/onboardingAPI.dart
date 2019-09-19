import 'dart:convert';
import '../model/data_model.dart';
import 'package:http/http.dart' as http;

class OnboardingAPI {
  static Future<DataModel> getSiteStatus() async {
    final url = 'https://onboard.free.beeceptor.com/';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return DataModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to site data');
    }
  }
}
