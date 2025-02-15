/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:aewallet/ui/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:oktoast/oktoast.dart';

enum ThreeLineAddressTextType { primary60, primary }

enum OneLineAddressTextType { primary60, primary, success }

class UIUtil {
  static Widget threeLinetextStyleSmallestW400Text(
    BuildContext context,
    WidgetRef ref,
    String address, {
    ThreeLineAddressTextType type = ThreeLineAddressTextType.primary,
    String? contactName,
  }) {
    var stringPartOne = '';
    var stringPartTwo = '';
    var stringPartThree = '';
    var stringPartFour = '';
    var stringPartFive = '';
    if (address.length >= 12) {
      stringPartOne = address.substring(0, 12);
    } else {
      stringPartOne = address.substring(0, address.length);
    }
    if (address.length >= 22) {
      stringPartTwo = address.substring(12, 22);
    } else {
      if (address.length > 12 && address.length < 22) {
        stringPartTwo = address.substring(12, address.length);
      }
    }
    if (address.length >= 44) {
      stringPartThree = address.substring(22, 44);
    } else {
      if (address.length > 22 && address.length < 44) {
        stringPartThree = address.substring(22, address.length);
      }
    }
    if (address.length >= 59) {
      stringPartFour = address.substring(44, 59);
    } else {
      if (address.length > 44 && address.length < 59) {
        stringPartFour = address.substring(44, address.length);
      } else {}
    }
    if (address.length >= 60) {
      stringPartFive = address.substring(59);
    }

    switch (type) {
      case ThreeLineAddressTextType.primary60:
        return Column(
          children: <Widget>[
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: '',
                children: <InlineSpan>[
                  TextSpan(
                    text: stringPartOne,
                    style: ArchethicThemeStyles.textStyleSize14W200Text60,
                  ),
                  TextSpan(
                    text: stringPartTwo,
                    style: ArchethicThemeStyles.textStyleSize14W200Text60,
                  ),
                ],
              ),
            ),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: '',
                children: <InlineSpan>[
                  TextSpan(
                    text: stringPartThree,
                    style: ArchethicThemeStyles.textStyleSize14W200Text60,
                  ),
                ],
              ),
            ),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: '',
                children: <InlineSpan>[
                  TextSpan(
                    text: stringPartFour,
                    style: ArchethicThemeStyles.textStyleSize14W200Text60,
                  ),
                  TextSpan(
                    text: stringPartFive,
                    style: ArchethicThemeStyles.textStyleSize14W200Text60,
                  ),
                ],
              ),
            ),
          ],
        );
      case ThreeLineAddressTextType.primary:
        final contactWidget = contactName != null
            ? Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: contactName,
                  style: ArchethicThemeStyles.textStyleSize14W200Primary,
                ),
              )
            : const SizedBox();
        return Column(
          children: <Widget>[
            contactWidget,
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: '',
                children: <InlineSpan>[
                  TextSpan(
                    text: stringPartOne,
                    style: ArchethicThemeStyles.textStyleSize14W200Primary,
                  ),
                  TextSpan(
                    text: stringPartTwo,
                    style: ArchethicThemeStyles.textStyleSize14W200Primary,
                  ),
                ],
              ),
            ),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: '',
                children: <InlineSpan>[
                  TextSpan(
                    text: stringPartThree,
                    style: ArchethicThemeStyles.textStyleSize14W200Primary,
                  ),
                ],
              ),
            ),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: '',
                children: <InlineSpan>[
                  TextSpan(
                    text: stringPartFour,
                    style: ArchethicThemeStyles.textStyleSize14W200Primary,
                  ),
                  TextSpan(
                    text: stringPartFive,
                    style: ArchethicThemeStyles.textStyleSize14W200Primary,
                  ),
                ],
              ),
            ),
          ],
        );
    }
  }

  static Widget threeLineSeedText(
    BuildContext context,
    WidgetRef ref,
    String address, {
    TextStyle? textStyle,
  }) {
    final resolvedTextStyle =
        textStyle ?? ArchethicThemeStyles.textStyleSize14W200Primary;
    final stringPartOne = address.substring(0, 22);
    final stringPartTwo = address.substring(22, 44);
    final stringPartThree = address.substring(44, 64);
    return Column(
      children: <Widget>[
        Text(
          stringPartOne,
          style: resolvedTextStyle,
        ),
        Text(
          stringPartTwo,
          style: resolvedTextStyle,
        ),
        Text(
          stringPartThree,
          style: resolvedTextStyle,
        ),
      ],
    );
  }

  static void showSnackbar(
    String content,
    BuildContext context,
    WidgetRef ref,
    Color boxDecorationColor,
    Color boxShadowColor, {
    Duration duration = const Duration(milliseconds: 3500),
    IconData icon = Symbols.warning,
  }) {
    showToastWidget(
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 14,
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          width: MediaQuery.of(context).size.width - 30,
          decoration: BoxDecoration(
            color: boxDecorationColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(15),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: boxShadowColor,
                offset: const Offset(0, 15),
                blurRadius: 30,
                spreadRadius: -5,
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 16,
                weight: IconSize.weightM,
                opticalSize: IconSize.opticalSizeM,
                grade: IconSize.gradeM,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  content,
                  style: ArchethicThemeStyles.textStyleSize14W200Background,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
      dismissOtherToast: true,
      duration: duration,
    );
  }
}
