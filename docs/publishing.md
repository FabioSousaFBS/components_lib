# Guia de Publicação

Este documento explica como publicar o package `components_lib` no pub.dev.

## Pré-requisitos

1. **Conta no pub.dev**: Crie uma conta em [pub.dev](https://pub.dev)
2. **Token de acesso**: Configure um token de acesso para publicação
3. **Verificação de identidade**: Complete a verificação de identidade no pub.dev

## Configuração Local

### 1. Configurar credenciais

```bash
dart pub token add https://pub.dev
```

### 2. Verificar package

```bash
flutter pub publish --dry-run
```

### 3. Publicar

```bash
flutter pub publish
```

## Configuração Automática (GitHub Actions)

O workflow `.github/workflows/ci.yml` está configurado para:

1. **Executar testes** em cada push
2. **Fazer dry-run** da publicação
3. **Publicar automaticamente** quando há push na branch `main`

### Configurar secrets

No GitHub, vá para Settings > Secrets and variables > Actions e adicione:

- `PUB_CREDENTIALS`: Token de acesso do pub.dev

## Versionamento

### Semântico

Seguimos o [Versionamento Semântico](https://semver.org/lang/pt-BR/):

- **MAJOR** (1.0.0): Mudanças incompatíveis
- **MINOR** (0.1.0): Novas funcionalidades compatíveis
- **PATCH** (0.0.1): Correções de bugs

### Atualizando versão

1. **Modifique o version** no `pubspec.yaml`
2. **Atualize o CHANGELOG.md**
3. **Commit e push** as mudanças
4. **Crie uma tag** para a versão

```bash
git tag v0.0.1
git push origin v0.0.1
```

## Checklist de Publicação

### Antes de publicar

- [ ] Todos os testes passam
- [ ] Análise estática sem erros
- [ ] Documentação atualizada
- [ ] CHANGELOG.md atualizado
- [ ] Version no pubspec.yaml correto
- [ ] README.md completo
- [ ] Exemplos funcionando

### Após publicar

- [ ] Verificar se apareceu no pub.dev
- [ ] Testar instalação em projeto novo
- [ ] Atualizar documentação se necessário
- [ ] Notificar usuários sobre nova versão

## Troubleshooting

### Erro de credenciais
```bash
dart pub token add https://pub.dev
```

### Erro de versionamento
- Verifique se a versão é maior que a anterior
- Confirme se não há conflitos

### Erro de dependências
- Verifique se todas as dependências estão corretas
- Confirme se não há dependências desnecessárias

## Links Úteis

- [pub.dev](https://pub.dev) - Repositório de packages
- [Documentação oficial](https://dart.dev/tools/pub/publishing) - Guia oficial
- [Versionamento Semântico](https://semver.org/lang/pt-BR/) - Padrão de versionamento
