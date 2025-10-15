# Guia de Uso

Este documento explica como usar os componentes da biblioteca `components_lib` em seu projeto Flutter.

## Componentes Disponíveis

### 🔘 FBButton

Botão personalizado com gradiente e suporte a loading.

#### Construtores

```dart
// Botão padrão
FBButton(
  texto: 'Continuar',
  onPressed: () {},
)

// Botão vermelho
FBButton.botaoVermelho(
  texto: 'Excluir',
  onPressed: () {},
)

// Botão cinza escuro
FBButton.botaoCinzaEscuro(
  texto: 'Cancelar',
  onPressed: () {},
)
```

#### Parâmetros

| Parâmetro | Tipo | Padrão | Descrição |
|-----------|------|--------|-----------|
| `texto` | String | - | Texto do botão |
| `onPressed` | VoidCallback? | - | Callback de clique |
| `isLoading` | bool | false | Mostra indicador de loading |
| `borderRadius` | double | 10.0 | Raio da borda |
| `fontSize` | double | 16.0 | Tamanho da fonte |
| `textColor` | Color? | Colors.white | Cor do texto |
| `backgroundColorPrimary` | Color? | Colors.red | Cor primária do gradiente |
| `backgroundColorSecundary` | Color? | Colors.red | Cor secundária do gradiente |
| `padding` | EdgeInsets | EdgeInsets.symmetric(horizontal: 24, vertical: 14) | Padding interno |

#### Exemplos

```dart
// Botão com loading
FBButton(
  texto: 'Salvando...',
  isLoading: true,
  onPressed: null,
)

// Botão personalizado
FBButton(
  texto: 'Meu Botão',
  borderRadius: 20.0,
  fontSize: 18.0,
  textColor: Colors.black,
  backgroundColorPrimary: Colors.blue,
  backgroundColorSecundary: Colors.lightBlue,
  onPressed: () {
    print('Botão pressionado!');
  },
)
```

### 📝 FBTextButton

Botão de texto com suporte a ícones.

#### Parâmetros

| Parâmetro | Tipo | Padrão | Descrição |
|-----------|------|--------|-----------|
| `texto` | String | - | Texto do botão |
| `onPressed` | VoidCallback? | - | Callback de clique |
| `textColor` | Color | Colors.black | Cor do texto |
| `fontSize` | double | 16.0 | Tamanho da fonte |
| `icon` | IconData? | null | Ícone opcional |
| `padding` | EdgeInsets | EdgeInsets.symmetric(horizontal: 16, vertical: 12) | Padding interno |

#### Exemplos

```dart
// Botão com ícone
FBTextButton(
  texto: 'Adicionar',
  icon: Icons.add,
  textColor: Colors.green,
  onPressed: () {
    print('Adicionar pressionado!');
  },
)

// Botão simples
FBTextButton(
  texto: 'Cancelar',
  textColor: Colors.red,
  onPressed: () {
    print('Cancelar pressionado!');
  },
)
```

### 📄 FBTextField

Campo de entrada personalizado com suporte a ícones e validações.

#### Parâmetros

| Parâmetro | Tipo | Padrão | Descrição |
|-----------|------|--------|-----------|
| `controller` | TextEditingController? | null | Controlador do campo |
| `hintText` | String | - | Texto de dica |
| `bordaVisivel` | bool | - | Mostra borda do campo |
| `iconeEsqueda` | IconData? | null | Ícone à esquerda |
| `iconeDireita` | IconData? | null | Ícone à direita |
| `obscureText` | bool? | false | Campo de senha |
| `readOnly` | bool | false | Somente leitura |
| `onTap` | VoidCallback? | null | Callback de toque |

#### Exemplos

```dart
// Campo de email
FBTextField(
  hintText: 'Digite seu email',
  iconeEsqueda: Icons.email,
  bordaVisivel: true,
)

// Campo de senha
FBTextField(
  hintText: 'Digite sua senha',
  iconeEsqueda: Icons.lock,
  iconeDireita: Icons.visibility,
  bordaVisivel: true,
  obscureText: true,
)

// Campo somente leitura
FBTextField(
  hintText: 'Campo somente leitura',
  bordaVisivel: true,
  readOnly: true,
)
```

### ✨ Shimmer

Efeito de loading animado para melhorar a experiência do usuário.

#### Parâmetros

| Parâmetro | Tipo | Padrão | Descrição |
|-----------|------|--------|-----------|
| `child` | Widget | - | Widget filho |
| `isLoading` | bool | - | Controla o estado de loading |
| `duration` | Duration | Duration(seconds: 2) | Duração da animação |

#### Exemplos

```dart
// Shimmer simples
Shimmer(
  isLoading: true,
  child: Container(
    width: 200,
    height: 100,
    color: Colors.grey[300],
  ),
)

// Shimmer com duração personalizada
Shimmer(
  isLoading: true,
  duration: Duration(seconds: 3),
  child: Card(
    child: ListTile(
      title: Text('Carregando...'),
      subtitle: Text('Aguarde um momento'),
    ),
  ),
)
```

## Padrões de Uso

### Formulários

```dart
class MeuFormulario extends StatefulWidget {
  @override
  _MeuFormularioState createState() => _MeuFormularioState();
}

class _MeuFormularioState extends State<MeuFormulario> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FBTextField(
            controller: _emailController,
            hintText: 'Email',
            iconeEsqueda: Icons.email,
            bordaVisivel: true,
          ),
          SizedBox(height: 16),
          FBTextField(
            controller: _senhaController,
            hintText: 'Senha',
            iconeEsqueda: Icons.lock,
            bordaVisivel: true,
            obscureText: true,
          ),
          SizedBox(height: 24),
          FBButton(
            texto: 'Entrar',
            isLoading: _isLoading,
            onPressed: _isLoading ? null : _entrar,
          ),
        ],
      ),
    );
  }

  void _entrar() async {
    setState(() {
      _isLoading = true;
    });

    // Simular login
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });
  }
}
```

### Listas com Shimmer

```dart
class MinhaLista extends StatefulWidget {
  @override
  _MinhaListaState createState() => _MinhaListaState();
}

class _MinhaListaState extends State<MinhaLista> {
  bool _isLoading = true;
  List<String> _itens = [];

  @override
  void initState() {
    super.initState();
    _carregarItens();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _isLoading ? 5 : _itens.length,
      itemBuilder: (context, index) {
        if (_isLoading) {
          return Shimmer(
            isLoading: true,
            child: Card(
              child: ListTile(
                title: Text('Carregando...'),
                subtitle: Text('Aguarde um momento'),
              ),
            ),
          );
        }

        return Card(
          child: ListTile(
            title: Text(_itens[index]),
            trailing: FBTextButton(
              texto: 'Excluir',
              icon: Icons.delete,
              textColor: Colors.red,
              onPressed: () => _excluirItem(index),
            ),
          ),
        );
      },
    );
  }

  void _carregarItens() async {
    // Simular carregamento
    await Future.delayed(Duration(seconds: 2));
    
    setState(() {
      _itens = ['Item 1', 'Item 2', 'Item 3'];
      _isLoading = false;
    });
  }

  void _excluirItem(int index) {
    setState(() {
      _itens.removeAt(index);
    });
  }
}
```

## Boas Práticas

### 1. Consistência Visual

```dart
// Use cores consistentes
const Color corPrimaria = Color(0xFF2196F3);
const Color corSecundaria = Color(0xFF64B5F6);

// Aplique em todos os componentes
FBButton(
  texto: 'Botão',
  backgroundColorPrimary: corPrimaria,
  backgroundColorSecundary: corSecundaria,
  onPressed: () {},
)
```

### 2. Acessibilidade

```dart
// Sempre forneça textos descritivos
FBButton(
  texto: 'Salvar alterações',
  onPressed: () {},
)

// Use ícones apropriados
FBTextButton(
  texto: 'Adicionar item',
  icon: Icons.add,
  onPressed: () {},
)
```

### 3. Performance

```dart
// Use const quando possível
const FBButton(
  texto: 'Botão Fixo',
  onPressed: null,
)

// Evite rebuilds desnecessários
FBTextField(
  controller: _controller,
  hintText: 'Campo',
  bordaVisivel: true,
)
```

### 4. Validação

```dart
// Sempre valide entradas
FBTextField(
  controller: _emailController,
  hintText: 'Email',
  iconeEsqueda: Icons.email,
  bordaVisivel: true,
  onTap: () {
    // Validação de email
  },
)
```

## Troubleshooting

### Problemas Comuns

1. **Botão não responde**
   - Verifique se `onPressed` não é null
   - Confirme se não está em estado de loading

2. **Campo não atualiza**
   - Verifique se o `controller` está conectado
   - Confirme se o `setState` está sendo chamado

3. **Shimmer não anima**
   - Verifique se `isLoading` é true
   - Confirme se o widget filho tem conteúdo

### Soluções

```dart
// Para problemas de estado
class MeuWidget extends StatefulWidget {
  @override
  _MeuWidgetState createState() => _MeuWidgetState();
}

class _MeuWidgetState extends State<MeuWidget> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FBButton(
      texto: 'Botão',
      isLoading: _isLoading,
      onPressed: _isLoading ? null : _acao,
    );
  }

  void _acao() {
    setState(() {
      _isLoading = true;
    });

    // Sua lógica aqui

    setState(() {
      _isLoading = false;
    });
  }
}
```

## Suporte

Para dúvidas ou problemas:

- **GitHub Issues**: [Reportar bugs](https://github.com/seu-usuario/components_lib/issues)
- **GitHub Discussions**: [Discussões](https://github.com/seu-usuario/components_lib/discussions)
- **Email**: suporte@exemplo.com
