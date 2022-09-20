import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';

void main() {
  test('adds one to input values', () {
    final calculator = FlutterUtilsProject();
    expect(FlutterUtilsProject.init(), 3);
  });
}
