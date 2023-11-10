import 'package:flutter/material.dart';
import 'package:dsfcrowdfunding/src/controllers/contribution_form_controller.dart';
import 'package:dsfcrowdfunding/src/controllers/crowdfunding_controller.dart';
import 'package:dsfcrowdfunding/src/controllers/hightlights_post_controller.dart';
import 'package:dsfcrowdfunding/src/theme/app_theme.dart';
import 'package:dsfcrowdfunding/src/ui/crowdfunding_page.dart';
import 'package:provider/provider.dart';

// 1c1d78db-c9b7-422f-9000-bf60ba764b01

class CrownfundingModule extends StatelessWidget {
  const CrownfundingModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContributionFormController(),
        ),
        ChangeNotifierProvider(
          create: (_) => CrowdfundingController(),
        ),
        ChangeNotifierProvider(
          create: (_) => HightlightsPostController(),
        ),
      ],
      child: Theme(
        data: defaultTheme,
        child: const CrowdfundingPage(),
      ),
    );
  }
}

class RedirectBuilder extends StatelessWidget {
  const RedirectBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final uri = Uri.base;
    final queryParameters = uri.queryParameters;
    final crowdfundingId = queryParameters['crowdfunding_id'];
    if (crowdfundingId == null) {
      return const Scaffold(
        body: Center(
          child: Column(
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: 42,
                color: Color(0xffFF4A01),
              ),
              SizedBox(height: 16),
              Text(
                'Erro ao carregar os destaques',
                style: TextStyle(
                  fontFamily: 'MangoGrotesque',
                  fontSize: 42,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return const CrowdfundingPage();
  }
}
