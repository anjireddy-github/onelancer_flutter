import 'dart:ui';

import 'package:flutter/widgets.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // ignore: unused_field
  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'Your Platform Name',
      'welcomeMessage':
          'Welcome to Your Platform Name. Join our community of freelancers and clients!',
      'exploreButton': 'Explore',
      'monetizationModel':
          'Monetization Model: We offer various subscription plans and value-added services to support our platform.',
      'transparentPricing':
          'Transparent Pricing: No hidden fees. Our pricing is clear and communicated upfront.',
      'valueAddedServices':
          'Value-Added Services: Opt for premium features, enhanced visibility, and additional tools.',
      'communityBuilding':
          'Community Building: Join our community to connect with freelancers and clients.',
      'userTrust':
          'User Trust: We prioritize trust and security for a reliable platform experience.',
      'userFeedback':
          'User Feedback: Your feedback is important! Help us refine our platform.',
      'marketingStrategy':
          'Marketing Strategy: Discover the benefits of using a platform with no platform charges.',
      'legalAndCompliance':
          'Legal and Compliance: We ensure compliance with legal requirements for a secure platform.',
    },

    // Add more languages as needed
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}
