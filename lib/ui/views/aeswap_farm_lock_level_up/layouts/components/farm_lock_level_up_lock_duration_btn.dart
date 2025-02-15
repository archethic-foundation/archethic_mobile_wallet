/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:aewallet/modules/aeswap/ui/views/util/farm_lock_duration_type.dart';
import 'package:aewallet/ui/views/aeswap_farm_lock_level_up/bloc/provider.dart';
import 'package:archethic_dapp_framework_flutter/archethic_dapp_framework_flutter.dart'
    as aedappfm;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FarmLockLevelUpDurationButton extends ConsumerWidget {
  const FarmLockLevelUpDurationButton({
    super.key,
    required this.farmLockLevelUpDuration,
    required this.level,
    required this.aprEstimation,
  });

  final FarmLockDepositDurationType farmLockLevelUpDuration;
  final String level;
  final double aprEstimation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final farmLockLevelUp = ref.watch(farmLockLevelUpFormNotifierProvider);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
      child: Container(
        width: 100,
        height: 80,
        decoration: BoxDecoration(
          color: farmLockLevelUp.farmLockLevelUpDuration ==
                  farmLockLevelUpDuration
              ? aedappfm.AppThemeBase.sheetBackgroundTertiary.withOpacity(0.9)
              : aedappfm.AppThemeBase.sheetBackgroundTertiary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).colorScheme.primaryContainer,
            width: 0.5,
          ),
        ),
        child: InkWell(
          onTap: () {
            ref.read(
              farmLockLevelUpFormNotifierProvider.notifier,
            )
              ..setFarmLockLevelUpDuration(farmLockLevelUpDuration)
              ..setLevel(level)
              ..setAPREstimation(
                aprEstimation,
              );
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.level} $level',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getFarmLockDepositDurationTypeLabel(
                        context,
                        farmLockLevelUpDuration,
                      ),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.farmLockLevelUpAPRLbl} ',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 8,
                          ),
                    ),
                    if (aprEstimation > 0)
                      Text(
                        '${aprEstimation.formatNumber(precision: 2)}%',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: _getColor(farmLockLevelUpDuration),
                            ),
                      )
                    else
                      const Padding(
                        padding: EdgeInsets.only(bottom: 2),
                        child: Icon(
                          Icons.all_inclusive,
                          size: 16,
                          color: Colors.white60,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getColor(FarmLockDepositDurationType farmLockLevelUpDuration) {
    switch (farmLockLevelUpDuration) {
      case FarmLockDepositDurationType.flexible:
        return aedappfm.ArchethicThemeBase.neutral0;
      case FarmLockDepositDurationType.oneWeek:
        return Colors.green[50]!;
      case FarmLockDepositDurationType.oneMonth:
        return Colors.green[50]!;
      case FarmLockDepositDurationType.threeMonths:
        return Colors.green[100]!;
      case FarmLockDepositDurationType.sixMonths:
        return Colors.green[200]!;
      case FarmLockDepositDurationType.oneYear:
        return Colors.green[200]!;
      case FarmLockDepositDurationType.twoYears:
        return Colors.green[300]!;
      case FarmLockDepositDurationType.threeYears:
        return Colors.green[300]!;
      case FarmLockDepositDurationType.max:
        return Colors.green[300]!;
    }
  }
}
