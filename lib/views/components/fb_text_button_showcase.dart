import 'package:flutter/material.dart';
import 'package:components_lib/components_lib.dart';

class FBTextButtonShowcase extends StatefulWidget {
  const FBTextButtonShowcase({super.key});

  @override
  State<FBTextButtonShowcase> createState() => _FBTextButtonShowcaseState();
}

class _FBTextButtonShowcaseState extends State<FBTextButtonShowcase> {
  // Parâmetros do FBTextButton
  String _texto = 'Texto do Botão';
  Color _textColor = Colors.black;
  double _fontSize = 16.0;
  double _paddingHorizontal = 16.0;
  double _paddingVertical = 12.0;
  IconData? _icon;
  bool _hasIcon = false;

  final List<IconData> _availableIcons = [
    Icons.home,
    Icons.settings,
    Icons.person,
    Icons.search,
    Icons.favorite,
    Icons.star,
    Icons.add,
    Icons.edit,
    Icons.delete,
    Icons.info,
  ];

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
                    'Controles do FBTextButton',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // Texto
                  const Text('Texto:',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Digite o texto do botão',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _texto = value;
                      });
                    },
                    controller: TextEditingController(text: _texto),
                  ),
                  const SizedBox(height: 20),

                  // Ícone
                  Row(
                    children: [
                      Checkbox(
                        value: _hasIcon,
                        onChanged: (bool? value) {
                          setState(() {
                            _hasIcon = value ?? false;
                            if (!_hasIcon) {
                              _icon = null;
                            } else if (_icon == null) {
                              _icon = _availableIcons.first;
                            }
                          });
                        },
                      ),
                      const Text('Mostrar Ícone'),
                    ],
                  ),

                  if (_hasIcon) ...[
                    const SizedBox(height: 16),
                    const Text('Ícone:',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    DropdownButton<IconData>(
                      value: _icon,
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
                            _icon = newValue;
                          });
                        }
                      },
                    ),
                  ],
                  const SizedBox(height: 20),

                  // Font Size
                  const Text('Tamanho da Fonte:',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  Slider(
                    value: _fontSize,
                    min: 10,
                    max: 30,
                    divisions: 20,
                    label: _fontSize.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _fontSize = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // Cor do Texto
                  const Text('Cor do Texto:',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: _textColor,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButton<Color>(
                          value: _textColor,
                          isExpanded: true,
                          items: [
                            Colors.black,
                            Colors.white,
                            Colors.red,
                            Colors.blue,
                            Colors.green,
                            Colors.orange,
                            Colors.purple,
                            Colors.teal,
                          ].map((Color color) {
                            return DropdownMenuItem<Color>(
                              value: color,
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: color,
                                      border: Border.all(color: Colors.grey),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(_getColorName(color)),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (Color? newValue) {
                            if (newValue != null) {
                              setState(() {
                                _textColor = newValue;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Padding Horizontal
                  const Text('Padding Horizontal:',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  Slider(
                    value: _paddingHorizontal,
                    min: 0,
                    max: 50,
                    divisions: 50,
                    label: _paddingHorizontal.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _paddingHorizontal = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // Padding Vertical
                  const Text('Padding Vertical:',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  Slider(
                    value: _paddingVertical,
                    min: 0,
                    max: 50,
                    divisions: 50,
                    label: _paddingVertical.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _paddingVertical = value;
                      });
                    },
                  ),
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
                  'Preview do FBTextButton',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),

                // Preview do botão
                Center(
                  child: _buildFBTextButton(),
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
                      Text('Texto: "$_texto"'),
                      Text(
                          'Ícone: ${_hasIcon ? _getIconName(_icon!) : "Nenhum"}'),
                      Text('Font Size: ${_fontSize.round()}'),
                      Text('Text Color: ${_getColorName(_textColor)}'),
                      Text(
                          'Padding: ${_paddingHorizontal.round()} x ${_paddingVertical.round()}'),
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

  Widget _buildFBTextButton() {
    return FBTextButton(
      texto: _texto,
      textColor: _textColor,
      fontSize: _fontSize,
      icon: _hasIcon ? _icon : null,
      padding: EdgeInsets.symmetric(
        horizontal: _paddingHorizontal,
        vertical: _paddingVertical,
      ),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('FBTextButton pressionado!')),
        );
      },
    );
  }

  String _getColorName(Color color) {
    if (color == Colors.white) return 'Branco';
    if (color == Colors.black) return 'Preto';
    if (color == Colors.red) return 'Vermelho';
    if (color == Colors.blue) return 'Azul';
    if (color == Colors.green) return 'Verde';
    if (color == Colors.orange) return 'Laranja';
    if (color == Colors.purple) return 'Roxo';
    if (color == Colors.teal) return 'Verde-azulado';
    return 'Personalizado';
  }

  String _getIconName(IconData icon) {
    if (icon == Icons.home) return 'Home';
    if (icon == Icons.settings) return 'Configurações';
    if (icon == Icons.person) return 'Pessoa';
    if (icon == Icons.search) return 'Buscar';
    if (icon == Icons.favorite) return 'Favorito';
    if (icon == Icons.star) return 'Estrela';
    if (icon == Icons.add) return 'Adicionar';
    if (icon == Icons.edit) return 'Editar';
    if (icon == Icons.delete) return 'Deletar';
    if (icon == Icons.info) return 'Informação';
    return 'Ícone';
  }
}
