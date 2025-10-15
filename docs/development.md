# Guia de Desenvolvimento

Este documento explica como desenvolver e contribuir para o projeto `components_lib`.

## Estrutura do Projeto

```
lib/
├── components/
│   ├── button/
│   │   └── fb_button.dart
│   ├── text_button/
│   │   └── fb_text_button.dart
│   ├── text_field/
│   │   └── fb_text_field.dart
│   ├── shimmer/
│   │   └── shimmer_widget.dart
│   └── ...
├── styles/
│   ├── colors.dart
│   ├── fonts.dart
│   └── spacing.dart
├── utils/
│   └── ...
└── components_lib.dart
```

## Convenções de Código

### Nomenclatura

- **Classes**: PascalCase (`FBButton`, `FBTextField`)
- **Métodos**: camelCase (`buildWidget`, `updateState`)
- **Variáveis**: camelCase (`texto`, `isLoading`)
- **Constantes**: SCREAMING_SNAKE_CASE (`DEFAULT_COLOR`)

### Estrutura de Arquivos

```
lib/
├── components/
│   └── [nome_componente]/
│       └── [nome_componente].dart
├── styles/
│   ├── colors.dart
│   ├── fonts.dart
│   └── spacing.dart
└── utils/
    └── ...
```

### Documentação

```dart
/// Descrição do componente
/// 
/// Exemplo de uso:
/// ```dart
/// FBButton(
///   texto: 'Continuar',
///   onPressed: () {},
/// )
/// ```
class FBButton extends StatelessWidget {
  /// Texto do botão
  final String texto;
  
  /// Callback de clique
  final VoidCallback? onPressed;
  
  /// Construtor do componente
  const FBButton({
    super.key,
    required this.texto,
    required this.onPressed,
  });
}
```

## Criando Novos Componentes

### 1. Estrutura Básica

```dart
import 'package:flutter/material.dart';

/// Componente personalizado
class MeuComponente extends StatelessWidget {
  /// Parâmetro obrigatório
  final String texto;
  
  /// Parâmetro opcional
  final bool? opcional;
  
  /// Construtor
  const MeuComponente({
    super.key,
    required this.texto,
    this.opcional,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(texto),
    );
  }
}
```

### 2. Adicionando ao Export

```dart
// lib/components_lib.dart
export 'components/meu_componente/meu_componente.dart';
```

### 3. Criando Testes

```dart
// test/components/meu_componente/meu_componente_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:components_lib/components_lib.dart';

void main() {
  testWidgets('MeuComponente renders text', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MeuComponente(
            texto: 'Teste',
          ),
        ),
      ),
    );

    expect(find.text('Teste'), findsOneWidget);
  });
}
```

## Padrões de Design

### 1. Consistência Visual

```dart
// Use cores consistentes
class AppColors {
  static const Color primary = Color(0xFF2196F3);
  static const Color secondary = Color(0xFF64B5F6);
  static const Color error = Color(0xFFE57373);
  static const Color success = Color(0xFF81C784);
}

// Aplique em todos os componentes
FBButton(
  texto: 'Botão',
  backgroundColorPrimary: AppColors.primary,
  backgroundColorSecundary: AppColors.secondary,
  onPressed: () {},
)
```

### 2. Responsividade

```dart
class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 768) {
          return mobile;
        } else if (constraints.maxWidth < 1024) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
```

### 3. Acessibilidade

```dart
class AcessibleButton extends StatelessWidget {
  final String texto;
  final VoidCallback? onPressed;
  final String? semanticLabel;

  const AcessibleButton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel ?? texto,
      button: true,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(texto),
      ),
    );
  }
}
```

## Testes

### 1. Testes Unitários

```dart
// test/components/button/fb_button_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:components_lib/components_lib.dart';

void main() {
  group('FBButton', () {
    testWidgets('renders provided text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FBButton(
              texto: 'Teste',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Teste'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FBButton(
              texto: 'Teste',
              onPressed: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}
```

### 2. Testes de Integração

```dart
// integration_test/app_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:components_lib/components_lib.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Integration Tests', () {
    testWidgets('full app test', (tester) async {
      await tester.pumpWidget(MyApp());
      
      // Teste completo da aplicação
      expect(find.byType(FBButton), findsOneWidget);
      
      await tester.tap(find.byType(FBButton));
      await tester.pump();
      
      // Verificar resultado
    });
  });
}
```

## Performance

### 1. Otimizações

```dart
// Use const quando possível
const FBButton(
  texto: 'Botão Fixo',
  onPressed: null,
)

// Evite rebuilds desnecessários
class OptimizedWidget extends StatefulWidget {
  @override
  _OptimizedWidgetState createState() => _OptimizedWidgetState();
}

class _OptimizedWidgetState extends State<OptimizedWidget> {
  @override
  Widget build(BuildContext context) {
    return FBButton(
      texto: 'Botão',
      onPressed: _onPressed,
    );
  }

  void _onPressed() {
    // Lógica do botão
  }
}
```

### 2. Memoização

```dart
class MemoizedWidget extends StatefulWidget {
  @override
  _MemoizedWidgetState createState() => _MemoizedWidgetState();
}

class _MemoizedWidgetState extends State<MemoizedWidget> {
  late final Widget _memoizedChild;

  @override
  void initState() {
    super.initState();
    _memoizedChild = FBButton(
      texto: 'Botão',
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return _memoizedChild;
  }
}
```

## Debugging

### 1. Logs

```dart
import 'package:flutter/foundation.dart';

class DebugWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('DebugWidget build called');
    }
    
    return Container();
  }
}
```

### 2. Breakpoints

```dart
class DebuggableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Adicione breakpoints aqui
    debugPrint('Building DebuggableWidget');
    
    return Container();
  }
}
```

## Deploy

### 1. Versionamento

```yaml
# pubspec.yaml
version: 0.0.1+1
```

### 2. Changelog

```markdown
# CHANGELOG.md
## [0.0.1] - 2024-10-14

### Adicionado
- Novo componente MeuComponente
- Suporte a acessibilidade
- Testes unitários

### Melhorado
- Performance dos componentes
- Documentação

### Corrigido
- Bug de layout
- Problema de acessibilidade
```

### 3. Publicação

```bash
# Verificar package
flutter pub publish --dry-run

# Publicar
flutter pub publish
```

## Ferramentas

### 1. VS Code

- **Flutter** extension
- **Dart** extension
- **GitLens** para Git
- **Bracket Pair Colorizer** para código

### 2. Android Studio

- **Flutter** plugin
- **Dart** plugin
- **Git** integration
- **Version Control** tools

### 3. Comandos Úteis

```bash
# Análise de código
flutter analyze

# Formatação
dart format .

# Testes
flutter test

# Build
flutter build web --release

# Limpeza
flutter clean
```

## Suporte

Para dúvidas ou problemas:

- **GitHub Issues**: [Reportar bugs](https://github.com/seu-usuario/components_lib/issues)
- **GitHub Discussions**: [Discussões](https://github.com/seu-usuario/components_lib/discussions)
- **Email**: suporte@exemplo.com
