import 'package:flutter_test/flutter_test.dart';

import 'package:components_lib/components_lib.dart';

void main() {
  test('FBButton can be constructed', () {
    final widget = FBButton(
      texto: 'Teste',
      onPressed: () {},
    );
    expect(widget.texto, 'Teste');
  });
}
