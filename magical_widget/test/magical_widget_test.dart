import 'package:flutter_test/flutter_test.dart';

import 'package:magical_widget/magical_widget.dart';

void main() {

  group('Testing the Creation of the Alakazam class', (){

  test('Creating an Alakazam without providing withProvider', () {
    final a = Alakazam();
    expect(a.withProvider, true);
  });

  test('Creating an Alakazam while providing withProvider', () {
    final a = Alakazam(withProvider: false);
    expect(a.withProvider, false);
  });

  });
}
