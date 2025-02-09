import 'package:aewallet/modules/aeswap/ui/views/util/app_styles.dart';
import 'package:aewallet/ui/views/aeswap_farm_lock_withdraw/bloc/provider.dart';
import 'package:archethic_dapp_framework_flutter/archethic_dapp_framework_flutter.dart'
    as aedappfm;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FarmLockWithdrawFinalAmount extends ConsumerWidget {
  const FarmLockWithdrawFinalAmount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final farmLockWithdraw = ref.watch(farmLockWithdrawFormNotifierProvider);
    final finalAmountReward = farmLockWithdraw.finalAmountReward;
    final finalAmountWithdraw = farmLockWithdraw.finalAmountWithdraw;
    final timeout = ref.watch(
      farmLockWithdrawFormNotifierProvider
          .select((value) => value.failure != null),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (finalAmountWithdraw != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    AppLocalizations.of(context)!.farmLockWithdrawFinalAmount,
                    style: AppTextStyles.bodyLarge(context),
                  ),
                  SelectableText(
                    '${finalAmountWithdraw.formatNumber(precision: 8)} ${finalAmountWithdraw > 1 ? AppLocalizations.of(context)!.lpTokens : AppLocalizations.of(context)!.lpToken}',
                    style: AppTextStyles.bodyLargeSecondaryColor(context),
                  ),
                ],
              )
            else if (timeout)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    AppLocalizations.of(context)!.farmLockWithdrawFinalAmount,
                    style: AppTextStyles.bodyLarge(context),
                  ),
                  SelectableText(
                    AppLocalizations.of(context)!.finalAmountNotRecovered,
                    style: AppTextStyles.bodyLarge(context),
                  ),
                ],
              ),
          ],
        ),
        Row(
          children: [
            if (finalAmountReward != null)
              if ((farmLockWithdraw.isFarmClose &&
                      farmLockWithdraw.rewardAmount! > 0) ||
                  farmLockWithdraw.isFarmClose == false)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      AppLocalizations.of(context)!
                          .farmLockWithdrawFinalAmountReward,
                      style: AppTextStyles.bodyLarge(context),
                    ),
                    SelectableText(
                      '${finalAmountReward.formatNumber(precision: 8)} ${farmLockWithdraw.rewardToken!.symbol}',
                      style: AppTextStyles.bodyLargeSecondaryColor(context),
                    ),
                  ],
                )
              else if (timeout)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      AppLocalizations.of(context)!
                          .farmLockWithdrawFinalAmountReward,
                      style: AppTextStyles.bodyLarge(context),
                    ),
                    SelectableText(
                      AppLocalizations.of(context)!.finalAmountNotRecovered,
                      style: AppTextStyles.bodyLarge(context),
                    ),
                  ],
                ),
          ],
        ),
      ],
    );
  }
}
