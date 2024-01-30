import 'package:flutter/material.dart';
import 'package:onelancer_flutter/AppLocalization.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('appTitle')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/landing_image.png', width: 200, height: 200), // Replace with your image
            SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.translate('welcomeMessage'),
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              child: Text(AppLocalizations.of(context)!.translate('exploreButton')),
            ),
            SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.translate('monetizationModel'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.translate('transparentPricing'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.translate('valueAddedServices'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.translate('communityBuilding'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.translate('userTrust'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.translate('userFeedback'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.translate('marketingStrategy'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.translate('legalAndCompliance'),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Text('Welcome to the Dashboard'),
      ),
    );
  }
}
