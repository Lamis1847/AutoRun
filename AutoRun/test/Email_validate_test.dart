import 'package:AutoRun/login_page.dart';
import 'package:test/test.dart';
import 'package:AutoRun/inscription_page.dart';

void main() {
  test('title', () {});
  test('Empty or invalid email returns String error', () {
    var result = EmailFieldValidator.validate('');
    expect(result, "Email can't be empty");
  });
}
