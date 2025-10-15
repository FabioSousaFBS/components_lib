# Guia de Contribuição

Este documento explica como contribuir para o projeto `components_lib`.

## Como Contribuir

### 1. Fork e Clone

```bash
git clone https://github.com/seu-usuario/components_lib.git
cd components_lib
```

### 2. Criar Branch

```bash
git checkout -b feature/nova-feature
```

### 3. Desenvolver

- **Siga as convenções** de código
- **Escreva testes** para novas funcionalidades
- **Atualize documentação** se necessário
- **Mantenha compatibilidade** com versões anteriores

### 4. Testar

```bash
flutter test
flutter analyze
dart format --set-exit-if-changed .
```

### 5. Commit e Push

```bash
git add .
git commit -m "feat: adiciona nova funcionalidade"
git push origin feature/nova-feature
```

### 6. Pull Request

- **Crie um PR** no GitHub
- **Descreva as mudanças** claramente
- **Referencie issues** relacionadas
- **Aguarde review** da equipe

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
│   ├── button/
│   │   └── fb_button.dart
│   ├── text_field/
│   │   └── fb_text_field.dart
│   └── ...
├── styles/
│   ├── colors.dart
│   ├── fonts.dart
│   └── spacing.dart
└── utils/
    └── ...
```

### Documentação

- **Comentários** para lógica complexa
- **Documentação** de parâmetros públicos
- **Exemplos** de uso quando necessário
- **README** atualizado

## Tipos de Contribuição

### 🐛 Bug Fixes

- **Identifique o problema** claramente
- **Reproduza o bug** com teste
- **Implemente a correção**
- **Adicione teste** para prevenir regressão

### ✨ Novas Funcionalidades

- **Discuta a proposta** em uma issue
- **Implemente seguindo** as convenções
- **Adicione testes** abrangentes
- **Atualize documentação**

### 📚 Documentação

- **Melhore README** e exemplos
- **Adicione comentários** no código
- **Crie guias** de uso
- **Traduza documentação**

### 🧪 Testes

- **Adicione testes** para casos não cobertos
- **Melhore cobertura** de código
- **Crie testes** de integração
- **Valide edge cases**

## Processo de Review

### Checklist para PRs

- [ ] **Código** segue convenções
- [ ] **Testes** passam e cobrem mudanças
- [ ] **Documentação** atualizada
- [ ] **Compatibilidade** mantida
- [ ] **Performance** não degradada
- [ ] **Acessibilidade** considerada

### Critérios de Aceitação

- **Funcionalidade** implementada corretamente
- **Testes** com cobertura adequada
- **Documentação** clara e completa
- **Performance** aceitável
- **Compatibilidade** com versões anteriores

## Ambiente de Desenvolvimento

### Requisitos

- **Flutter** >= 3.16.0
- **Dart** >= 3.3.0
- **VS Code** ou **Android Studio**
- **Git** para controle de versão

### Configuração

1. **Clone o repositório**
2. **Execute** `flutter pub get`
3. **Execute** `flutter test` para verificar
4. **Configure** seu editor preferido

### Ferramentas Recomendadas

- **VS Code** com extensões Flutter
- **Android Studio** com Flutter plugin
- **Git** para controle de versão
- **GitHub CLI** para facilitar PRs

## Comunicação

### Issues

- **Use templates** fornecidos
- **Seja específico** sobre problemas
- **Forneça contexto** suficiente
- **Use labels** apropriadas

### Discussões

- **GitHub Discussions** para ideias
- **Issues** para bugs e features
- **Pull Requests** para código
- **Releases** para anúncios

## Código de Conduta

### Valores

- **Respeito** mútuo
- **Colaboração** construtiva
- **Inclusão** de todos
- **Profissionalismo** em comunicações

### Comportamento Esperado

- **Seja respeitoso** com outros contribuidores
- **Seja construtivo** em feedback
- **Seja paciente** com novos contribuidores
- **Seja profissional** em todas as interações

### Comportamento Inaceitável

- **Linguagem** ofensiva ou discriminatória
- **Comportamento** inadequado ou desrespeitoso
- **Spam** ou conteúdo irrelevante
- **Violação** de privacidade

## Reconhecimento

### Contribuidores

- **Mencione** contribuidores em releases
- **Destaque** contribuições significativas
- **Reconheça** esforços da comunidade
- **Celebre** marcos do projeto

### Agradecimentos

- **Obrigado** por contribuir!
- **Sua ajuda** é valiosa para o projeto
- **Juntos** construímos algo incrível
- **Continue** contribuindo!

## Links Úteis

- [Flutter](https://flutter.dev/) - Framework oficial
- [Dart](https://dart.dev/) - Linguagem de programação
- [GitHub](https://github.com/) - Plataforma de desenvolvimento
- [pub.dev](https://pub.dev/) - Repositório de packages
