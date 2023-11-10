import 'package:flutter/material.dart';
import 'package:dsfcrowdfunding/src/ui/widgets/user_icon.dart';
import 'package:image_network/image_network.dart';

class CrowdfundingImageCard extends StatelessWidget {
  const CrowdfundingImageCard({
    super.key,
    this.hasBorder = true,
  });
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: 300,
            child: SizedBox.expand(
              child: ClipRRect(
                borderRadius: hasBorder
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      )
                    : BorderRadius.zero,
                child: ImageNetwork(
                  image:
                      'https://m.media-amazon.com/images/I/71NwkKA-hmL._AC_UF894,1000_QL80_.jpg',
                  height: 300,
                  width: MediaQuery.sizeOf(context).width,
                  fitAndroidIos: BoxFit.cover,
                  fitWeb: BoxFitWeb.cover,
                  onLoading: const CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withAlpha(160),
                      Colors.black,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                if (!hasBorder) const SizedBox(width: 16),
                UserIcon(
                  icon: Uri.parse(
                      'https://img.freepik.com/fotos-gratis/retrato-de-homem-branco-isolado_53876-40306.jpg?size=626&ext=jpg&ga=GA1.1.1826414947.1699401600&semt=ais'),
                  radius: 116,
                ),
                const SizedBox(width: 8),
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      'VAQUINHA PARA\nCHUTEIRA DO MURILO!',
                      style: TextStyle(
                        fontFamily: 'MangoGrotesque',
                        fontWeight: FontWeight.w600,
                        fontSize: 38,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Adidas Predator Accuracy',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xff7E7E7E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
