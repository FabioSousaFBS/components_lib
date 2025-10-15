import 'package:components_lib/components_lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget _wrap(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: child),
      ),
    );
  }

  testWidgets('FBButton renders provided text', (tester) async {
    await tester.pumpWidget(
      _wrap(
        FBButton(
          texto: 'Continuar',
          onPressed: () {},
        ),
      ),
    );

    expect(find.text('Continuar'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('FBButton calls onPressed when tapped', (tester) async {
    var tapped = false;

    await tester.pumpWidget(
      _wrap(
        FBButton(
          texto: 'Tap me',
          onPressed: () {
            tapped = true;
          },
        ),
      ),
    );

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(tapped, isTrue);
  });

  testWidgets('FBButton shows loading and disables tap when isLoading',
      (tester) async {
    var tapped = false;

    await tester.pumpWidget(
      _wrap(
        FBButton(
          texto: 'Loading',
          isLoading: true,
          onPressed: () {
            tapped = true;
          },
        ),
      ),
    );

    // Shows loading indicator and hides text label
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Loading'), findsNothing);

    // ElevatedButton should be disabled
    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(button.onPressed, isNull);

    // Taps should not trigger callback
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(tapped, isFalse);
  });

  testWidgets('FBButton respects custom text color', (tester) async {
    const customColor = Colors.black;

    await tester.pumpWidget(
      _wrap(
        const FBButton(
          texto: 'Cor personalizada',
          textColor: customColor,
          onPressed: null, // state does not matter for style
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.text('Cor personalizada'));
    expect(textWidget.style?.color, equals(customColor));
  });

  testWidgets('FBButton.botaoVermelho applies expected gradient colors',
      (tester) async {
    await tester.pumpWidget(
      _wrap(
        FBButton.botaoVermelho(
          texto: 'Excluir',
          onPressed: () {},
        ),
      ),
    );

    // The top-level Container provides the gradient decoration
    final container = tester.widget<Container>(find.byType(Container).first);
    final decoration = container.decoration as BoxDecoration?;
    final gradient = decoration?.gradient as LinearGradient?;

    expect(gradient, isNotNull);
    expect(gradient!.colors.length, 2);
    expect(gradient.colors.first, const Color.fromARGB(255, 185, 15, 3));
    expect(gradient.colors.last, const Color.fromARGB(255, 243, 86, 75));
  });
}
