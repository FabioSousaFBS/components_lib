# Changelog

Todas as mudanças notáveis neste projeto serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/),
e este projeto adere ao [Versionamento Semântico](https://semver.org/lang/pt-BR/).

## [0.0.1] - 2024-10-14

### Adicionado
- **FBButton**: Botão personalizado com gradiente e loading
  - Construtor padrão com cores personalizáveis
  - Construtor `botaoVermelho()` com gradiente vermelho
  - Construtor `botaoCinzaEscuro()` com gradiente cinza escuro
  - Suporte a loading com indicador visual
  - Controle de border radius, font size e padding
  - Cores de texto personalizáveis

- **FBTextButton**: Botão de texto com suporte a ícones
  - Texto personalizável
  - Ícones opcionais (10 opções disponíveis)
  - Controle de cor do texto e tamanho da fonte
  - Padding configurável

- **FBTextField**: Campo de entrada personalizado
  - Texto de dica configurável
  - Borda visível/oculta
  - Suporte a texto oculto (senha)
  - Modo somente leitura
  - Ícones à esquerda e direita (10 opções cada)
  - Callback de toque

- **Shimmer**: Efeito de loading animado
  - Animação suave de shimmer
  - Duração configurável
  - Controle de estado de loading
  - Suporte a qualquer widget filho

- **ManualOrPickerDate**: Componente de seleção de data
  - Opção manual de entrada
  - Picker de data nativo
  - Formatação automática

- **PageViewCard**: Card personalizado para PageView
  - Layout otimizado para carrossel
  - Suporte a conteúdo dinâmico

- **Separadores**: Componentes de separação visual
  - `CompSeparadorPadrao`: Separador padrão
  - `CompSeparadorCinza`: Separador cinza
  - `CompSeparadorVermelho`: Separador vermelho

- **FrequentAccessCard**: Card para acesso rápido
  - Layout otimizado para funcionalidades frequentes
  - Suporte a ícones e textos

- **FBTextFormField**: Campo de formulário com validação
  - Integração com Form do Flutter
  - Validação automática
  - Mensagens de erro personalizáveis

### Documentação
- README.md completo com exemplos de uso
- Documentação de todos os parâmetros
- Guia de instalação e configuração
- Exemplos práticos para cada componente

### Testes
- Testes unitários para FBButton
- Cobertura de casos de uso principais
- Validação de propriedades e comportamentos

## [Próximas Versões]

### Planejado
- **FBAppBar**: AppBar personalizado com ações customizáveis
- **FBCard**: Card com diferentes estilos e elevações
- **FBListTile**: ListTile personalizado com ícones e ações
- **FBDialog**: Dialog customizado com diferentes estilos
- **FBSnackBar**: SnackBar personalizado com ações
- **FBProgressIndicator**: Indicador de progresso customizado
- **FBChip**: Chip personalizado com diferentes estilos
- **FBToggle**: Toggle switch customizado
- **FBSlider**: Slider personalizado com marcações
- **FBStepper**: Stepper customizado para formulários

### Melhorias Planejadas
- Suporte a temas dark/light
- Animações mais suaves
- Melhor acessibilidade
- Suporte a RTL (Right-to-Left)
- Documentação interativa
- Mais opções de personalização
- Suporte a diferentes densidades de tela