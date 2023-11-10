import 'package:flutter/material.dart';

class CardOfProduct extends StatelessWidget {
  const CardOfProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xff1E1D1D),
      ),
      height: 160,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(16),
            ),
            child: SizedBox(
              height: 160,
              width: 150,
              child: Image.network(
                'https://m.media-amazon.com/images/I/71NwkKA-hmL._AC_UF894,1000_QL80_.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ADIDAS\nPREDATOR\nACCURACY',
                style: TextStyle(
                  fontFamily: 'Archivo',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Branca e cinza',
                style: TextStyle(
                  fontFamily: 'Archivo',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xffA6A6A6),
                ),
              ),
              SizedBox(height: 8),
              Chip(
                label: Text(
                  'TAM. 38',
                  style: TextStyle(
                    color: Color(0xffD8D8D8),
                    fontFamily: 'Archivo',
                    fontSize: 16,
                  ),
                ),
                // color: MaterialStateProperty.all(const Color(0xffD8D8D8)),
                backgroundColor: Color(0xff414141),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
