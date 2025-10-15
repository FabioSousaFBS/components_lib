import 'package:components_lib/components/separadores/comp-separador-padrao.dart';
import 'package:components_lib/components/shimmer/shimmer_widget.dart';
import 'package:components_lib/components/text_button/fb_text_button.dart';
import 'package:components_lib/styles/colors.dart';
import 'package:flutter/material.dart';

class FrequentAccessCard extends StatelessWidget {
  final String titulo;
  final String descricao;
  final IconData icone;
  Function()? onTap;
  bool isLoading;

  final Color color = Colors.white;

  FrequentAccessCard({
    super.key,
    required this.titulo,
    required this.descricao,
    required this.icone,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Shimmer(
        isLoading: isLoading,
        child: Container(
          margin: const EdgeInsets.only(left: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.red.shade900,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(
                        icone,
                        color: AppColorsFB.buttonText,
                        size: 35,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      titulo,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  descricao,
                  style: const TextStyle(
                      color: Colors.black54, fontSize: 14, height: 1.5),
                ),
                SeparadorPadrao(),
                Align(
                    alignment: Alignment.centerRight,
                    child: FBTextButton(
                      texto: "ACESSAR",
                      textColor: Colors.red.shade900,
                      onPressed: onTap,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
