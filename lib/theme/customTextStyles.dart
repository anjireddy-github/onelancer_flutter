
import 'package:flutter/material.dart';
import 'package:onelancer_flutter/theme/appTheme.dart';

class CustomTextStyles {
  // Body text style
  static get bodySmallBluegray600 => theme.textTheme.bodySmall!.copyWith(
        color: themeColors.blueGray600,
      );
  static get bodySmallBluegray900 => theme.textTheme.bodySmall!.copyWith(
        color: themeColors.blueGray900,
      );
  static get bodyMediumBlack => theme.textTheme.bodyMedium!.copyWith(
    color: themeColors.black
  );
  static get bodyLargeWhite => theme.textTheme.bodyLarge!.copyWith(
    color: Colors.white
  );
  // Headline text style
  static get headlineMediumBold => theme.textTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );
  // Label text style
  static get labelLargeBluegray400 => theme.textTheme.labelLarge!.copyWith(
        color: themeColors.blueGray400,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeBluegray40001 => theme.textTheme.labelLarge!.copyWith(
        color: themeColors.blueGray400,
      );
  static get labelLargeBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get labelLargeGreen600 => theme.textTheme.labelLarge!.copyWith(
        color: themeColors.green,
      );
  static get labelLargeIndigo500 => theme.textTheme.labelLarge!.copyWith(
        color: themeColors.indigo500,
      );
  static get labelLargeOnPrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
  static get labelLargeOnPrimaryBold => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get labelLargePinkA200 => theme.textTheme.labelLarge!.copyWith(
        color: themeColors.pink200,
      );
  static get labelLargeRed700 => theme.textTheme.labelLarge!.copyWith(
        color: themeColors.red700,
      );
  static get labelLargeTealA400 => theme.textTheme.labelLarge!.copyWith(
        color: themeColors.teal400,
      );
  static get labelMediumBluegray40001 => theme.textTheme.labelMedium!.copyWith(
        color: themeColors.blueGray400,
      );
  static get labelMediumIndigo500 => theme.textTheme.labelMedium!.copyWith(
        color: themeColors.indigo500,
      );
  // Title text style
  static get titleMediumBluegray40001 => theme.textTheme.titleMedium!.copyWith(
        color: themeColors.blueGray400,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBluegray40001Medium =>
      theme.textTheme.titleMedium!.copyWith(
        color: themeColors.blueGray400,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBluegray800 => theme.textTheme.titleMedium!.copyWith(
        color: themeColors.blueGray900,
      );
  static get titleMediumOnPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontWeight: FontWeight.w500,
      );
  static get titleMediumOnPrimary_1 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumPrimary_1 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallBluegray40001 => theme.textTheme.titleSmall!.copyWith(
        color: themeColors.blueGray400,
      );
  static get titleSmallGreen600 => theme.textTheme.titleSmall!.copyWith(
        color: themeColors.green,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallGreen600_1 => theme.textTheme.titleSmall!.copyWith(
        color: themeColors.green,
      );
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get titleSmallOnPrimary_1 => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallPrimaryBold => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallRed700 => theme.textTheme.titleSmall!.copyWith(
        color: themeColors.red700,
      );
  static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
