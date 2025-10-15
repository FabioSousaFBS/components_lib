import 'package:flutter/material.dart';
import 'package:components_lib/components_lib.dart';

class FBButtonShowcase extends StatefulWidget {
  const FBButtonShowcase({super.key});

  @override
  State<FBButtonShowcase> createState() => _FBButtonShowcaseState();
}

class _FBButtonShowcaseState extends State<FBButtonShowcase> {
  // Parâmetros do FBButton
  String _texto = 'Continuar';
  bool _isLoading = false;
  double _borderRadius = 10.0;
  double _fontSize = 16.0;
  Color _textColor = Colors.white;
  Color _backgroundColorPrimary = Colors.red;
  Color _backgroundColorSecondary = Colors.red;
  double _paddingHorizontal = 24.0;
  double _paddingVertical = 14.0;
  String _buttonType = 'Padrão';

  final List<String> _buttonTypes = ['Padrão', 'Vermelho', 'Cinza Escuro'];

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
                    'Controles do FBButton',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // Tipo do botão
                  const Text('Tipo do Botão:',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  DropdownButton<String>(
                    value: _buttonType,
                    isExpanded: true,
                    items: _buttonTypes.map((String type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _buttonType = newValue;
                          _updateButtonType(newValue);
                        });
                      }
                    },
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

                  // Loading
                  Row(
                    children: [
                      Checkbox(
                        value: _isLoading,
                        onChanged: (bool? value) {
                          setState(() {
                            _isLoading = value ?? false;
                          });
                        },
                      ),
                      const Text('Mostrar Loading'),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Border Radius
                  const Text('Border Radius:',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  Slider(
                    value: _borderRadius,
                    min: 0,
                    max: 50,
                    divisions: 50,
                    label: _borderRadius.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _borderRadius = value;
                      });
                    },
                  ),
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
                            Colors.white,
                            Colors.black,
                            Colors.red,
                            Colors.blue,
                            Colors.green,
                            Colors.orange,
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
                  'Preview do FBButton',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),

                // Preview do botão
                Center(
                  child: _buildFBButton(),
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
                      Text('Tipo: $_buttonType'),
                      Text('Texto: "$_texto"'),
                      Text('Loading: $_isLoading'),
                      Text('Border Radius: ${_borderRadius.round()}'),
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

  Widget _buildFBButton() {
    switch (_buttonType) {
      case 'Vermelho':
        return FBButton.botaoVermelho(
          texto: _texto,
          isLoading: _isLoading,
          borderRadius: _borderRadius,
          fontSize: _fontSize,
          textColor: _textColor,
          padding: EdgeInsets.symmetric(
            horizontal: _paddingHorizontal,
            vertical: _paddingVertical,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Botão $_buttonType pressionado!')),
            );
          },
        );
      case 'Cinza Escuro':
        return FBButton.botaoCinzaEscuro(
          texto: _texto,
          isLoading: _isLoading,
          borderRadius: _borderRadius,
          fontSize: _fontSize,
          textColor: _textColor,
          padding: EdgeInsets.symmetric(
            horizontal: _paddingHorizontal,
            vertical: _paddingVertical,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Botão $_buttonType pressionado!')),
            );
          },
        );
      default:
        return FBButton(
          texto: _texto,
          isLoading: _isLoading,
          borderRadius: _borderRadius,
          fontSize: _fontSize,
          backgroundColorPrimary: _backgroundColorPrimary,
          backgroundColorSecundary: _backgroundColorSecondary,
          textColor: _textColor,
          padding: EdgeInsets.symmetric(
            horizontal: _paddingHorizontal,
            vertical: _paddingVertical,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Botão $_buttonType pressionado!')),
            );
          },
        );
    }
  }

  void _updateButtonType(String type) {
    switch (type) {
      case 'Vermelho':
        _backgroundColorPrimary = const Color.fromARGB(255, 185, 15, 3);
        _backgroundColorSecondary = const Color.fromARGB(255, 243, 86, 75);
        break;
      case 'Cinza Escuro':
        _backgroundColorPrimary = const Color(0xFF5B5959);
        _backgroundColorSecondary = const Color(0xff898484);
        break;
      default:
        _backgroundColorPrimary = Colors.red;
        _backgroundColorSecondary = Colors.red;
        break;
    }
  }

  String _getColorName(Color color) {
    if (color == Colors.white) return 'Branco';
    if (color == Colors.black) return 'Preto';
    if (color == Colors.red) return 'Vermelho';
    if (color == Colors.blue) return 'Azul';
    if (color == Colors.green) return 'Verde';
    if (color == Colors.orange) return 'Laranja';
    return 'Personalizado';
  }
}
