import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito_demo/person.dart';
import 'package:mockito_demo/person_services.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock with http.Client {}

void main() {
  http.Client client = MockClient();

  test('Test ambil data', () async {
    String id = '1';
    when(client.get('.../persons/$id'))
        .thenAnswer((_) async => Future.value(http.Response('''
{
  "id" : $id,
  "name" : "Muflikhan",
  "age" : 22
}''', 200)));
    Person person = await PersonServices.getUserById(id, client);
    expect(person, equals(Person(id: 1, name: 'Muflikhan', age: 22)));
  });

  test('Test Error', () async {
    String id = '1';
    when(client.get('.../persons/$id'))
        .thenAnswer((_) async => Future.value(http.Response('''
         {
          "message" : "tidak ada akses"
         }''', 403)));
    expect(PersonServices.getUserById(id, client), throwsException);
  });
}
