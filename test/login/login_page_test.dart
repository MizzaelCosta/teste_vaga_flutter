import 'package:flutter_test/flutter_test.dart';
import 'package:validatorless/validatorless.dart';

void main() {
  group('Validador "required"', () {
    test('rejeita quando é vazio', () {
      const expectedError = 'Este campo não pode ser vazio';
      final validator = Validatorless.required(expectedError);
      final error = validator('');
      expect(error, expectedError);
    });

    test('rejeita quando é nulo', () {
      const expectedError = 'Este campo não pode ser vazio';
      final validator = Validatorless.required(expectedError);
      final error = validator(null);
      expect(error, expectedError);
    });

    test('aceita quando é não vazio/nulo', () {
      const expectedError = 'Este campo não pode ser vazio';
      final validator = Validatorless.required(expectedError);
      final error = validator('texto válido');
      expect(error, isNull);
    });
  });

  group('validador "max"', () {
    test('rejeita quando é maior que o limite', () {
      const expectedError = 'Este campo não pode ter mais de 20 caracteres';
      final validator = Validatorless.max(20, expectedError);
      final error = validator('testo com mais de 20 caracteres');
      expect(error, expectedError);
    });
    test('aceita quando é menor que o limite', () {
      const expectedError = 'Este campo não pode ter mais de 20 caracteres';
      final validator = Validatorless.max(20, expectedError);
      final error = validator('menos de 20 caract');
      expect(error, isNull);
    });
  });

  group('validador "min"', () {
    test('rejeita quando é menor que o mínimo', () {
      const expectedError = 'Este campo não pode ter menos de 2 caracteres';
      final validator = Validatorless.min(2, expectedError);
      final error = validator('1');
      expect(error, expectedError);
    });

    test('aceita quando é maior ou igual ao mínimo', () {
      const expectedError = 'Este campo não pode ter menos de 2 caracteres';
      final validator = Validatorless.min(2, expectedError);
      final error = validator('12');
      expect(error, isNull);
    });
  });
}
