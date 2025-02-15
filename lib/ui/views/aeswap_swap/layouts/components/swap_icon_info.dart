import 'package:aewallet/ui/views/aeswap_swap/bloc/provider.dart';
import 'package:aewallet/ui/views/aeswap_swap/layouts/components/swap_infos.dart';
import 'package:archethic_dapp_framework_flutter/archethic_dapp_framework_flutter.dart'
    as aedappfm;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SwapTokenIconInfo extends ConsumerWidget {
  const SwapTokenIconInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swap = ref.watch(swapFormNotifierProvider);
    final disabled = swap.tokenToSwap == null ||
        swap.tokenSwapped == null ||
        swap.pool == null ||
        swap.pool!.poolAddress.isEmpty;

    return InkWell(
      onTap: disabled || swap.calculationInProgress
          ? null
          : () async {
              await CupertinoScaffold.showCupertinoModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return FractionallySizedBox(
                    heightFactor: 1,
                    child: Scaffold(
                      backgroundColor: aedappfm.AppThemeBase.sheetBackground
                          .withOpacity(0.2),
                      body: const SwapInfos(),
                    ),
                  );
                },
              );
            },
      child: Container(
        height: 36,
        width: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: disabled
              ? aedappfm.AppThemeBase.gradient
              : aedappfm.AppThemeBase.gradientBtn,
          shape: BoxShape.circle,
        ),
        child: Icon(
          aedappfm.Iconsax.info_circle,
          color: disabled ? Colors.white60 : Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
