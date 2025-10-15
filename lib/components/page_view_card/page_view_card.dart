import 'package:components_lib/components/shimmer/shimmer_widget.dart';
import 'package:components_lib/styles/colors.dart';
import 'package:flutter/material.dart';

class PageViewCard extends StatelessWidget {
  final String titulo;
  final String? subTitulo;
  final String descricao;
  final IconData icone;
  final bool isLoading;

  final Color color = Colors.white;

  const PageViewCard({
    super.key,
    required this.titulo,
    required this.descricao,
    required this.icone,
    this.subTitulo,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      isLoading: isLoading,
      child: Container(
        margin: const EdgeInsets.only(left: 12),
        padding: const EdgeInsets.all(10),
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                titulo,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
                overflow: TextOverflow.fade,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.red.shade900,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      icone,
                      color: AppColorsFB.buttonText,
                      size: 25,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(subTitulo ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
