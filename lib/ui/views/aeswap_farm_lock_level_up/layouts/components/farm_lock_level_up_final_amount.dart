import 'package:aewallet/modules/aeswap/ui/views/util/app_styles.dart';
import 'package:aewallet/ui/views/aeswap_farm_lock_level_up/bloc/provider.dart';
import 'package:archethic_dapp_framework_flutter/archethic_dapp_framework_flutter.dart'
    as aedappfm;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FarmLockLevelUpFinalAmount extends ConsumerWidget {
  const FarmLockLevelUpFinalAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final farmLockLevelUp = ref.watch(farmLockLevelUpFormNotifierProvider);
    final finalAmount = farmLockLevelUp.finalAmount;
    final timeout = ref.watch(
      farmLockLevelUpFormNotifierProvider
          .select((value) => value.failure != null),
    );

    return Row(
      children: [
        if (finalAmount != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                AppLocalizations.of(context)!.farmLockLevelUpFinalAmount,
                style: AppTextStyles.bodyLarge(context),
              ),
              SelectableText(
                '${finalAmount.formatNumber(precision: 8)} ${finalAmount > 1 ? AppLocalizations.of(context)!.lpTokens : AppLocalizations.of(context)!.lpToken}',
                style: AppTextStyles.bodyLargeSecondaryColor(context),
              ),
            ],
          )
        else if (timeout)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                AppLocalizations.of(context)!.farmLockLevelUpFinalAmount,
                style: AppTextStyles.bodyLarge(context),
              ),
              SelectableText(
                AppLocalizations.of(context)!.finalAmountNotRecovered,
                style: AppTextStyles.bodyLarge(context),
              ),
            ],
          ),
      ],
    );
  }
}
