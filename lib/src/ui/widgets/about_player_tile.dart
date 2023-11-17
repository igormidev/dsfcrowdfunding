import 'package:dsfcrowdfunding/src/ui/widgets/user_icon.dart';
import 'package:flutter/material.dart';

class AboutPlayer extends StatelessWidget {
  const AboutPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'O Atleta',
            style: TextStyle(
              fontFamily: 'Archivo',
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserIcon(
                icon: Uri.parse(
                  'https://img.freepik.com/fotos-gratis/retrato-de-homem-branco-isolado_53876-40306.jpg?size=626&ext=jpg&ga=GA1.1.1826414947.1699401600&semt=ais',
                ),
                radius: 70,
              ),
              const SizedBox(width: 20),
              const Text(
                'MURILO NUNES',
                style: TextStyle(
                  fontFamily: 'MangoGrotesque',
                  fontWeight: FontWeight.w600,
                  fontSize: 38,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
