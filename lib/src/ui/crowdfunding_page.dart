import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dsfcrowdfunding/src/controllers/crowdfunding_controller.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dsfcrowdfunding/src/ui/widgets/card_of_product.dart';
import 'package:dsfcrowdfunding/src/ui/widgets/target_price_card.dart';
import 'package:dsfcrowdfunding/src/ui/widgets/contribution_section.dart';
import 'package:dsfcrowdfunding/src/ui/widgets/crowdfunding_image_header.dart';
import 'package:dsfcrowdfunding/src/theme/shared_widgets/custom_buttons.dart';
import 'package:dsfcrowdfunding/src/theme/shared_widgets/gradient_divider.dart';

class CrowdfundingPage extends StatelessWidget {
  const CrowdfundingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final queryParameters = Uri.base.queryParameters;
    final crowdfundingId = queryParameters['crowdfunding_id'];

    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future:
            context.read<CrowdfundingController>().getFundings(crowdfundingId),
        builder: (context, snapshot) {
          final isDone = snapshot.connectionState == ConnectionState.done;

          if (isDone) {
            final hasError = snapshot.hasError;
            if (hasError) {
              return const Center(
                child: SizedBox(
                  height: 220,
                  width: 320,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline_rounded,
                          size: 42,
                          color: Color(0xffFF4A01),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Não encontrado a\nvaquinha desejada',
                          style: TextStyle(
                            fontFamily: 'MangoGrotesque',
                            fontSize: 42,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            return const _CrowdfundingWidget();
          } else {
            return const Center(
              child: SizedBox(
                height: 220,
                width: 320,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class _CrowdfundingWidget extends StatelessWidget {
  const _CrowdfundingWidget();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.maybeOf(context);
    return ListView(
      padding: mediaQuery!.padding.copyWith(left: 0, right: 0, bottom: 0),
      children: [
        Container(
          color: const Color(0xff303030),
          height: 55,
          child: Row(
            children: [
              const SizedBox(width: 16),
              SvgPicture.asset(
                'assets/images/logo.svg',
                height: 30,
              ),
              const SizedBox(width: 8),
              const Text(
                'Faça parte da\ncomunidade do futebol.',
                style: TextStyle(
                  fontFamily: 'Archivo',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xffA1A1A1),
                ),
              ),
              const Spacer(),
              PrimaryButton(
                title: 'BAIXE AGORA',
                onPressed: () {
                  final appId = kIsWeb || Platform.isAndroid
                      ? 'dreamstock.com.dreamstock'
                      : '1329441315';

                  final url = Uri.parse(
                    kIsWeb || Platform.isAndroid
                        ? 'market://details?id=$appId'
                        : 'https://apps.apple.com/app/id$appId',
                  );
                  launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                },
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
        const LinearProgressIndicator(
          value: 0.65,
          backgroundColor: Color(0xff767676),
        ),
        const CrowdfundingHeader(),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Descrição',
            style: TextStyle(
              fontFamily: 'Archivo',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Me ajude a conquistar minha chuteira dos sonhos! Lorem ipsum dolor '
            'sit amet, consectetur adipiscing elit, sed do eiusmod tempor '
            'incididunt ut labore et dolore magna aliqua.',
            style: TextStyle(
              fontFamily: 'Archivo',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xffA1A1A1),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const GradientDivider(),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'A chuteira',
            style: TextStyle(
              fontFamily: 'Archivo',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CardOfProduct(),
        ),
        const SizedBox(height: 16),
        // const AboutPlayer(),
        // const HightlightsSection(),
        // const SizedBox(height: 16),
        const GradientDivider(),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'O objetivo',
            style: TextStyle(
              fontFamily: 'Archivo',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TargetPriceCard(),
        ),
        const SizedBox(height: 16),
        const ContributeSection(),
      ],
    );
  }
}
