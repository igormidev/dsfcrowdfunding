import 'package:flutter/material.dart';

class TargetPriceCard extends StatelessWidget {
  const TargetPriceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xff1E1D1D),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        children: [
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'R\$ 107/ ',
                style: TextStyle(
                  fontFamily: 'MangoGrotesque',
                  fontWeight: FontWeight.w600,
                  fontSize: 60,
                  color: Color(0xffACACAC),
                ),
              ),
              Text(
                'R\$ 280',
                style: TextStyle(
                  fontFamily: 'MangoGrotesque',
                  fontWeight: FontWeight.w600,
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            '45% ATINGIDO',
            style: TextStyle(
              fontFamily: 'Archivo',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xff707070),
            ),
          ),
          SizedBox(height: 16),
          LinearProgressIndicator(
            value: 0.65,
            minHeight: 8,
            backgroundColor: Color(0xff767676),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Contribuintes',
                style: TextStyle(
                  fontFamily: 'Archivo',
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: Color(0xffA7A7A7),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          DonatersListTile(
            title: 'TIO RICARDO',
            description: 'Boa sorte sobrinho!',
            price: 20,
          ),
          DonatersListTile(
            title: 'JOSÉ FERNANDO',
            description: 'Parabéns pela iniciativa, conte comigo',
            price: 20,
          ),
          DonatersListTile(
            title: 'CARLOS RODRIGUES',
            description: 'Joga muito!',
            price: 20,
          ),
          DonatersListTile(
            title: 'MARIA RITA',
            description: 'sucesso murilo',
            price: 20,
          ),
        ],
      ),
    );
  }
}

class DonatersListTile extends StatelessWidget {
  const DonatersListTile({
    super.key,
    required this.title,
    required this.description,
    required this.price,
  });
  final String title;
  final String description;
  final int price;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Archivo',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        description,
        style: const TextStyle(
          fontFamily: 'Archivo',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Color(0xffA7A7A7),
          fontStyle: FontStyle.italic,
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xff3A3A3A),
        ),
        width: 80,
        height: 30,
        child: Center(
          child: Text(
            'R\$ $price',
            style: const TextStyle(
              fontFamily: 'Archivo',
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
