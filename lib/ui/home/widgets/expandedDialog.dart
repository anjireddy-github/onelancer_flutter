import 'package:flutter/material.dart';
import 'package:onelancer_flutter/ui/home/widgets/ProjectDetails.dart';

import '../../../theme/appTheme.dart';
import '../../../theme/customTextStyles.dart';
import '../../../widgets/customElevatedButton.dart';

class ExpandableDialog extends StatefulWidget {
  @override
  _ExpandableDialogState createState() => _ExpandableDialogState();
}

class _ExpandableDialogState extends State<ExpandableDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: SingleChildScrollView(
              child: ProjectDetails(),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
