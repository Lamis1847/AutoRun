import 'package:AutoRun/Inscription_page.dart';
import 'package:test/test.dart';


void main() {
  test('title', () {});
  test('Empty or invalid email returns String error', () {
    var result = EmailFieldValidator.validate('Lamisesi.com');
    expect(result, "Email can't be empty or invalid");
  });
  test('Empty or invalid name returns String error', () {
    var res = NameFieldValidator.validate('Lam9s');
    expect(res, "Name can't be empty or invalid");
  });
  test('Empty or invalid password returns String error', () {
    var resu = PasswordFieldValidator.validate('Lam9');
    expect(resu, "Password can't be empty or invalid");
  });
  test('Empty or invalid phone number returns String error', () {
    var resu = PhoneFieldValidator.validate('1559');
    expect(resu, "Phone number can't be empty or invalid");
  });
}
