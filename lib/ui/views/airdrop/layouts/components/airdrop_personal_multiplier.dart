import 'package:aewallet/modules/aeswap/ui/views/util/app_styles.dart';
import 'package:aewallet/ui/themes/archethic_theme_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AirdropPersonalMultiplier extends ConsumerWidget {
  const AirdropPersonalMultiplier({
    required this.personalMultiplier,
    super.key,
  });

  final int? personalMultiplier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    return Container(
      height: 100,
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
      decoration: BoxDecoration(
        border: Border.all(
          color: ArchethicThemeBase.palePurpleBorder,
        ),
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${personalMultiplier ?? 0}x',
            style: AppTextStyles.bodyLarge(context).copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            localizations.airdropPersonalMultiplier,
            style: AppTextStyles.bodyMediumWithOpacity(context),
          ),
        ],
      ),
    );
  }
}
