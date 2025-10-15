# Guia de Instalação

Este documento explica como instalar e configurar o package `components_lib` em seu projeto Flutter.

## Instalação

### 1. Adicione ao pubspec.yaml

```yaml
dependencies:
  components_lib:
    git:
      url: https://github.com/seu-usuario/components_lib.git
      ref: main
```

### 2. Execute pub get

```bash
flutter pub get
```

### 3. Importe no seu projeto

```dart
import 'package:components_lib/components_lib.dart';
```

## Configuração

### Tema Personalizado

Para personalizar o tema dos componentes:

```dart
import 'package:flutter/material.dart';
import 'package:components_lib/components_lib.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      theme: ThemeData(
        // Configure seu tema aqui
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const MyHomePage(),
    );
  }
}
```

### Cores Personalizadas

```dart
// Defina cores personalizadas
const Color minhaCorPrimaria = Color(0xFF2196F3);
const Color minhaCorSecundaria = Color(0xFF64B5F6);

// Use nos componentes
FBButton(
  texto: 'Meu Botão',
  backgroundColorPrimary: minhaCorPrimaria,
  backgroundColorSecundary: minhaCorSecundaria,
  onPressed: () {},
)
```

## Exemplos de Uso

### FBButton

```dart
// Botão padrão
FBButton(
  texto: 'Continuar',
  onPressed: () {
    print('Botão pressionado!');
  },
)

// Botão com loading
FBButton(
  texto: 'Salvando...',
  isLoading: true,
  onPressed: null,
)

// Botão vermelho
FBButton.botaoVermelho(
  texto: 'Excluir',
  onPressed: () {
    // Ação de exclusão
  },
)
```

### FBTextButton

```dart
FBTextButton(
  texto: 'Cancelar',
  icon: Icons.close,
  textColor: Colors.red,
  onPressed: () {
    // Ação de cancelamento
  },
)
```

### FBTextField

```dart
FBTextField(
  hintText: 'Digite seu email',
  iconeEsqueda: Icons.email,
  bordaVisivel: true,
  obscureText: false,
)
```

### Shimmer

```dart
Shimmer(
  isLoading: true,
  duration: Duration(seconds: 2),
  child: Container(
    width: 200,
    height: 100,
    color: Colors.grey[300],
  ),
)
```

## Troubleshooting

### Erro de dependências

```bash
flutter clean
flutter pub get
```

### Erro de import

```dart
// Certifique-se de que o import está correto
import 'package:components_lib/components_lib.dart';
```

### Erro de versão

```yaml
# Verifique se a versão do Flutter é compatível
environment:
  sdk: ">=3.3.0 <4.0.0"
  flutter: ">=3.16.0"
```

## Migração

### De versão anterior

Se você está migrando de uma versão anterior:

1. **Atualize** o pubspec.yaml
2. **Execute** `flutter pub get`
3. **Verifique** se há breaking changes
4. **Atualize** o código conforme necessário

### Breaking Changes

Consulte o [CHANGELOG.md](CHANGELOG.md) para informações sobre breaking changes.

## Suporte

### Documentação

- [README.md](README.md) - Documentação principal
- [CHANGELOG.md](CHANGELOG.md) - Histórico de mudanças
- [Exemplos](examples/) - Exemplos de uso

### Comunidade

- [GitHub Issues](https://github.com/seu-usuario/components_lib/issues) - Reportar bugs
- [GitHub Discussions](https://github.com/seu-usuario/components_lib/discussions) - Discussões
- [Pull Requests](https://github.com/seu-usuario/components_lib/pulls) - Contribuições

### Contato

- **Email**: suporte@exemplo.com
- **GitHub**: [@seu-usuario](https://github.com/seu-usuario)
- **Twitter**: [@seu-usuario](https://twitter.com/seu-usuario)

## Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Changelog

### v0.0.1 (2024-10-14)

#### Adicionado
- FBButton com gradiente e loading
- FBTextButton com suporte a ícones
- FBTextField personalizado
- Shimmer para loading
- Componentes de separação
- Documentação completa

#### Melhorado
- Performance dos componentes
- Acessibilidade
- Responsividade

#### Corrigido
- Bugs de layout
- Problemas de acessibilidade
- Erros de validação
