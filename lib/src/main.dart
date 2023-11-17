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
