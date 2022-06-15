import 'package:mockito_demo/warrior.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockWarrior extends Mock implements Warrior {}

void main() {
  MockWarrior warrior = MockWarrior();

  test('Verify Demo', () {
    // warrior.rest();
    // warrior.rest();
    // verify(warrior.rest()).called(2);

    warrior.rest();
    warrior.training();
    verifyInOrder([warrior.rest(), warrior.training()]);
  });

  test('Null demo', () {
    expect(warrior.name, isNull);
  });

  test('thenReturn demo', () {
    when(warrior.name).thenReturn('no name');
    expect(warrior.name, equals('no name'));
  });

  test('thenThrow demo', () {
    when(warrior.rest()).thenThrow(Exception('Can\'t sleep'));
    expect(() => warrior.rest(), throwsException);
  });

  test('thenAnswer demo', () async {
    when(warrior.training()).thenAnswer((_) => Future.value(true));
    bool result = await warrior.training();
    expect(result, equals(true));
  });
}
