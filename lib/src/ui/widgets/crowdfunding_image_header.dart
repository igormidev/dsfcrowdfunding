import 'package:flutter/material.dart';
import 'package:dsfcrowdfunding/src/ui/widgets/crowdfunding_image_card.dart';

class CrowdfundingHeader extends StatelessWidget {
  const CrowdfundingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CrowdfundingImageCard(
          hasBorder: false,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withAlpha(120),
                Colors.transparent,
              ],
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Navigator.canPop(context))
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 32,
                    ),
                  ),
                ),
              const SizedBox(width: 4),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.ios_share_outlined, size: 32),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  const SizedBox(height: 8),
                  Text(
                    'R\$ 107/',
                    style: TextStyle(
                      fontFamily: 'MangoGrotesque',
                      fontWeight: FontWeight.w600,
                      fontSize: 38,
                      // color: Color.fromARGB(255, 90, 90, 90),
                      // color: Colors.white,
                      color: Colors.grey[200]!,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'R\$ 280',
                    style: TextStyle(
                      fontFamily: 'MangoGrotesque',
                      fontWeight: FontWeight.w600,
                      fontSize: 38,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ],
    );
  }
}
