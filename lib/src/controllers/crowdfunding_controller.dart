import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dsfcrowdfunding/src/models/crowdfunding.dart';
import 'package:dsfcrowdfunding/src/services/crowd_funding_service.dart';

class CrowdfundingController extends ChangeNotifier {
  CrowdFunding? crowdFunding;
  final CrowdFundingService _service = CrowdFundingService();

  Future<void> getFundings(String? crowdfundingId) async {
    if (crowdfundingId == null) throw Exception('Crowdfunding id is null');
    try {
      final response = await _service.getCrowdfunding(crowdfundingId);
      crowdFunding = response;
      notifyListeners();
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      rethrow;
    }
  }
}
