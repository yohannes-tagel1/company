import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/model_page.dart';


class Company_service {
  final String baseUrl = 'https://fake-json-api.mock.beeceptor.com/companies';
  // Future<List<dynamic>> fetchPost() async {
  // final respose = await http.get(Uri.parse(baseUrl));
  Future<List<Company>> fetchCompanies() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List jsonList = json.decode(response.body);

      return jsonList.map((e) => Company.fromJson(e)).toList();
    } else {
      throw Exception('Failed ');
    }
  }
}