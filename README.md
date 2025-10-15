# Components Library

Uma biblioteca de componentes Flutter reutilizáveis para aplicações internas, desenvolvida com foco em consistência visual e facilidade de uso.

## 📦 Componentes Disponíveis

### 🔘 FBButton
Botão personalizado com gradiente e suporte a loading.

**Construtores disponíveis:**
- `FBButton()` - Botão padrão com cores personalizáveis
- `FBButton.botaoVermelho()` - Botão com gradiente vermelho
- `FBButton.botaoCinzaEscuro()` - Botão com gradiente cinza escuro

**Parâmetros:**
- `texto` (String) - Texto do botão
- `onPressed` (VoidCallback?) - Callback de clique
- `isLoading` (bool) - Mostra indicador de loading
- `borderRadius` (double) - Raio da borda
- `fontSize` (double) - Tamanho da fonte
- `textColor` (Color?) - Cor do texto
- `backgroundColorPrimary` (Color?) - Cor primária do gradiente
- `backgroundColorSecundary` (Color?) - Cor secundária do gradiente
- `padding` (EdgeInsets) - Padding interno

### 📝 FBTextButton
Botão de texto com suporte a ícones.

**Parâmetros:**
- `texto` (String) - Texto do botão
- `onPressed` (VoidCallback?) - Callback de clique
- `textColor` (Color) - Cor do texto
- `fontSize` (double) - Tamanho da fonte
- `icon` (IconData?) - Ícone opcional
- `padding` (EdgeInsets) - Padding interno

### 📄 FBTextField
Campo de entrada personalizado com suporte a ícones e validações.

**Parâmetros:**
- `controller` (TextEditingController?) - Controlador do campo
- `hintText` (String) - Texto de dica
- `bordaVisivel` (bool) - Mostra borda do campo
- `iconeEsqueda` (IconData?) - Ícone à esquerda
- `iconeDireita` (IconData?) - Ícone à direita
- `obscureText` (bool?) - Campo de senha
- `readOnly` (bool) - Somente leitura
- `onTap` (VoidCallback?) - Callback de toque

### ✨ Shimmer
Efeito de loading animado para melhorar a experiência do usuário.

**Parâmetros:**
- `child` (Widget) - Widget filho
- `isLoading` (bool) - Controla o estado de loading
- `duration` (Duration) - Duração da animação

### 📅 ManualOrPickerDate
Componente para seleção de datas com opção manual ou picker.

### 🎴 PageViewCard
Card personalizado para uso em PageView.

### 🏷️ Separadores
Componentes de separação visual:
- `CompSeparadorPadrao` - Separador padrão
- `CompSeparadorCinza` - Separador cinza
- `CompSeparadorVermelho` - Separador vermelho

### 🎯 FrequentAccessCard
Card para acesso rápido a funcionalidades frequentes.

## 🚀 Instalação

### 1. Adicione ao pubspec.yaml

```yaml
dependencies:
  components_lib:
    git:
      url: https://github.com/seu-usuario/components_lib.git
```

### 2. Importe no seu projeto

```dart
import 'package:components_lib/components_lib.dart';
```

## 📖 Exemplos de Uso

### FBButton

```dart
// Botão padrão
FBButton(
  texto: 'Continuar',
  onPressed: () {
    // Ação do botão
  },
)

// Botão vermelho
FBButton.botaoVermelho(
  texto: 'Excluir',
  onPressed: () {
    // Ação de exclusão
  },
)

// Botão com loading
FBButton(
  texto: 'Salvando...',
  isLoading: true,
  onPressed: null,
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

## 🎨 Personalização

Todos os componentes seguem o design system da aplicação e podem ser personalizados através de parâmetros específicos. As cores padrão são:

- **Vermelho**: `Color.fromARGB(255, 185, 15, 3)` → `Color.fromARGB(255, 243, 86, 75)`
- **Cinza Escuro**: `Color(0xFF5B5959)` → `Color(0xff898484)`

## 🧪 Testes

Execute os testes com:

```bash
flutter test
```

## 📋 Requisitos

- Flutter >= 3.16.0
- Dart >= 3.3.0

## 🤝 Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -am 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 📞 Suporte

Para dúvidas ou sugestões, abra uma issue no GitHub ou entre em contato com a equipe de desenvolvimento.