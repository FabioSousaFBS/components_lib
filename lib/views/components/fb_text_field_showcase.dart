import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:components_lib/components_lib.dart';

class FBTextFieldShowcase extends StatefulWidget {
  const FBTextFieldShowcase({super.key});

  @override
  State<FBTextFieldShowcase> createState() => _FBTextFieldShowcaseState();
}

class _FBTextFieldShowcaseState extends State<FBTextFieldShowcase> {
  // Parâmetros do FBTextField
  String _hintText = 'Digite aqui...';
  bool _bordaVisivel = true;
  bool _obscureText = false;
  bool _readOnly = false;
  IconData? _iconeEsquerda;
  IconData? _iconeDireita;
  bool _hasLeftIcon = false;
  bool _hasRightIcon = false;
  final TextEditingController _controller = TextEditingController();

  final List<IconData> _availableIcons = [
    Icons.person,
    Icons.email,
    Icons.lock,
    Icons.search,
    Icons.phone,
    Icons.location_on,
    Icons.calendar_today,
    Icons.attach_money,
    Icons.visibility,
    Icons.visibility_off,
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Painel de controles
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: const Border(right: BorderSide(color: Colors.grey)),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Controles do FBTextField',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // Hint Text
                  const Text('Texto de Dica:',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite o texto de dica',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _hintText = value;
                      });
                    },
                    controller: TextEditingController(text: _hintText),
                  ),
                  const SizedBox(height: 20),

                  // Borda Visível
                  Row(
                    children: [
                      Checkbox(
                        value: _bordaVisivel,
                        onChanged: (bool? value) {
                          setState(() {
                            _bordaVisivel = value ?? false;
                          });
                        },
                      ),
                      const Text('Borda Visível'),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Obscure Text
                  Row(
                    children: [
                      Checkbox(
                        value: _obscureText,
                        onChanged: (bool? value) {
                          setState(() {
                            _obscureText = value ?? false;
                          });
                        },
                      ),
                      const Text('Texto Oculto (Senha)'),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Read Only
                  Row(
                    children: [
                      Checkbox(
                        value: _readOnly,
                        onChanged: (bool? value) {
                          setState(() {
                            _readOnly = value ?? false;
                          });
                        },
                      ),
                      const Text('Somente Leitura'),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Ícone Esquerda
                  Row(
                    children: [
                      Checkbox(
                        value: _hasLeftIcon,
                        onChanged: (bool? value) {
                          setState(() {
                            _hasLeftIcon = value ?? false;
                            if (!_hasLeftIcon) {
                              _iconeEsquerda = null;
                            } else if (_iconeEsquerda == null) {
                              _iconeEsquerda = _availableIcons.first;
                            }
                          });
                        },
                      ),
                      const Text('Ícone à Esquerda'),
                    ],
                  ),

                  if (_hasLeftIcon) ...[
                    const SizedBox(height: 16),
                    const Text('Ícone Esquerda:',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    DropdownButton<IconData>(
                      value: _iconeEsquerda,
                      isExpanded: true,
                      items: _availableIcons.map((IconData icon) {
                        return DropdownMenuItem<IconData>(
                          value: icon,
                          child: Row(
                            children: [
                              Icon(icon, size: 20),
                              const SizedBox(width: 8),
                              Text(_getIconName(icon)),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (IconData? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _iconeEsquerda = newValue;
                          });
                        }
                      },
                    ),
                  ],
                  const SizedBox(height: 20),

                  // Ícone Direita
                  Row(
                    children: [
                      Checkbox(
                        value: _hasRightIcon,
                        onChanged: (bool? value) {
                          setState(() {
                            _hasRightIcon = value ?? false;
                            if (!_hasRightIcon) {
                              _iconeDireita = null;
                            } else if (_iconeDireita == null) {
                              _iconeDireita = _availableIcons.first;
                            }
                          });
                        },
                      ),
                      const Text('Ícone à Direita'),
                    ],
                  ),

                  if (_hasRightIcon) ...[
                    const SizedBox(height: 16),
                    const Text('Ícone Direita:',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    DropdownButton<IconData>(
                      value: _iconeDireita,
                      isExpanded: true,
                      items: _availableIcons.map((IconData icon) {
                        return DropdownMenuItem<IconData>(
                          value: icon,
                          child: Row(
                            children: [
                              Icon(icon, size: 20),
                              const SizedBox(width: 8),
                              Text(_getIconName(icon)),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (IconData? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _iconeDireita = newValue;
                          });
                        }
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),

        // Preview do widget
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Preview do FBTextField',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),

                // Preview do campo
                SizedBox(
                  width: 300,
                  child: _buildFBTextField(),
                ),

                const SizedBox(height: 40),

                // Informações do widget
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Parâmetros Atuais:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text('Hint Text: "$_hintText"'),
                      Text('Borda Visível: $_bordaVisivel'),
                      Text('Texto Oculto: $_obscureText'),
                      Text('Somente Leitura: $_readOnly'),
                      Text(
                          'Ícone Esquerda: ${_hasLeftIcon ? _getIconName(_iconeEsquerda!) : "Nenhum"}'),
                      Text(
                          'Ícone Direita: ${_hasRightIcon ? _getIconName(_iconeDireita!) : "Nenhum"}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFBTextField() {
    return FBTextField(
      controller: _controller,
      hintText: _hintText,
      bordaVisivel: _bordaVisivel,
      iconeEsqueda: _hasLeftIcon ? _iconeEsquerda : null,
      iconeDireita: _hasRightIcon ? _iconeDireita : null,
      obscureText: _obscureText,
      readOnly: _readOnly,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Campo de texto tocado!')),
        );
      },
    );
  }

  String _getIconName(IconData icon) {
    if (icon == Icons.person) return 'Pessoa';
    if (icon == Icons.email) return 'Email';
    if (icon == Icons.lock) return 'Bloqueio';
    if (icon == Icons.search) return 'Buscar';
    if (icon == Icons.phone) return 'Telefone';
    if (icon == Icons.location_on) return 'Localização';
    if (icon == Icons.calendar_today) return 'Calendário';
    if (icon == Icons.attach_money) return 'Dinheiro';
    if (icon == Icons.visibility) return 'Visível';
    if (icon == Icons.visibility_off) return 'Oculto';
    return 'Ícone';
  }
}
