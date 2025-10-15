import 'package:flutter/material.dart';
import 'package:components_lib/components_lib.dart';

class ShimmerShowcase extends StatefulWidget {
  const ShimmerShowcase({super.key});

  @override
  State<ShimmerShowcase> createState() => _ShimmerShowcaseState();
}

class _ShimmerShowcaseState extends State<ShimmerShowcase> {
  // Parâmetros do Shimmer
  bool _isLoading = true;
  Duration _duration = const Duration(seconds: 2);
  String _contentType = 'Card';
  Color _baseColor = Colors.grey.shade400;
  Color _highlightColor = Colors.grey.shade200;

  final List<String> _contentTypes = ['Card', 'Lista', 'Texto', 'Botão'];

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
                    'Controles do Shimmer',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

                  // Tipo de Conteúdo
                  const Text('Tipo de Conteúdo:',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  DropdownButton<String>(
                    value: _contentType,
                    isExpanded: true,
                    items: _contentTypes.map((String type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _contentType = newValue;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 20),

                  // Duração
                  const Text('Duração da Animação:',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  Slider(
                    value: _duration.inMilliseconds.toDouble(),
                    min: 500,
                    max: 5000,
                    divisions: 9,
                    label:
                        '${(_duration.inMilliseconds / 1000).toStringAsFixed(1)}s',
                    onChanged: (double value) {
                      setState(() {
                        _duration = Duration(milliseconds: value.round());
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // Cor Base
                  const Text('Cor Base:',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: _baseColor,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButton<Color>(
                          value: _baseColor,
                          isExpanded: true,
                          items: [
                            Colors.grey.shade400,
                            Colors.grey.shade300,
                            Colors.grey.shade500,
                            Colors.blue.shade300,
                            Colors.red.shade300,
                            Colors.green.shade300,
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
                                _baseColor = newValue;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Cor de Destaque
                  const Text('Cor de Destaque:',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: _highlightColor,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButton<Color>(
                          value: _highlightColor,
                          isExpanded: true,
                          items: [
                            Colors.grey.shade200,
                            Colors.grey.shade100,
                            Colors.white,
                            Colors.blue.shade100,
                            Colors.red.shade100,
                            Colors.green.shade100,
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
                                _highlightColor = newValue;
                              });
                            }
                          },
                        ),
                      ),
                    ],
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
                  'Preview do Shimmer',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),

                // Preview do shimmer
                Center(
                  child: _buildShimmerContent(),
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
                      Text('Loading: $_isLoading'),
                      Text('Tipo de Conteúdo: $_contentType'),
                      Text(
                          'Duração: ${(_duration.inMilliseconds / 1000).toStringAsFixed(1)}s'),
                      Text('Cor Base: ${_getColorName(_baseColor)}'),
                      Text('Cor Destaque: ${_getColorName(_highlightColor)}'),
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

  Widget _buildShimmerContent() {
    Widget content;

    switch (_contentType) {
      case 'Card':
        content = Container(
          width: 200,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              'Card de Exemplo',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        );
        break;
      case 'Lista':
        content = Column(
          children: List.generate(
              3,
              (index) => Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    width: 250,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Item ${index + 1}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  )),
        );
        break;
      case 'Texto':
        content = Column(
          children: [
            Container(
              width: 200,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 150,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 180,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        );
        break;
      case 'Botão':
        content = Container(
          width: 120,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Center(
            child: Text(
              'Botão',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        );
        break;
      default:
        content = Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
        );
    }

    return Shimmer(
      isLoading: _isLoading,
      duration: _duration,
      child: content,
    );
  }

  String _getColorName(Color color) {
    if (color == Colors.grey.shade400) return 'Cinza Médio';
    if (color == Colors.grey.shade300) return 'Cinza Claro';
    if (color == Colors.grey.shade500) return 'Cinza Escuro';
    if (color == Colors.grey.shade200) return 'Cinza Muito Claro';
    if (color == Colors.grey.shade100) return 'Cinza Quase Branco';
    if (color == Colors.white) return 'Branco';
    if (color == Colors.blue.shade300) return 'Azul Claro';
    if (color == Colors.red.shade300) return 'Vermelho Claro';
    if (color == Colors.green.shade300) return 'Verde Claro';
    if (color == Colors.blue.shade100) return 'Azul Muito Claro';
    if (color == Colors.red.shade100) return 'Vermelho Muito Claro';
    if (color == Colors.green.shade100) return 'Verde Muito Claro';
    return 'Personalizado';
  }
}
