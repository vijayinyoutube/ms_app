import 'dart:convert';

import 'package:http/http.dart' as http;

import '../API/api.dart';
import '../Models/homepage_model.dart';

abstract class HomePageRepository {
  Future<List<HomePageMode>> fetchAnimalDetails();
}

class HomePageRepo extends HomePageRepository {
  @override
  Future<List<HomePageMode>> fetchAnimalDetails() async {
    final response = await http
        .get(Uri.parse("$baseUrl/facts/random?animal_type=cat&amount=2"));
    if (response.statusCode == 200) {
      print(response.body);

      return (jsonDecode(response.body) as List)
          .map((p) => HomePageMode.fromMap(p))
          .toList();
    } else {
      throw Exception('Failed to load API data');
    }
  }
}


