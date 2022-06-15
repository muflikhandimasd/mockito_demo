import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mockito_demo/person.dart';
import 'dart:convert';

class PersonServices {
  static Future<Person> getUserById(String id, http.Client client) async {
    // <Instance of 'Future<Person>'>
    // try {
    //   String url = '.../persons/$id';
    //   var response = await client.get(url);
    //   if (response.statusCode != 200) {
    //     throw Exception('error');
    //   }
    //   var result = json.decode(response.body);

    //   return Person.fromJson(result);
    // } catch (e) {
    //   print(e);
    //   log(e.toString());
    // }

    // Exception
    String url = '.../persons/$id';
    var response = await client.get(url);
    if (response.statusCode != 200) {
      throw Exception('error');
    }
    var result = json.decode(response.body);

    return Person.fromJson(result);
  }
}
