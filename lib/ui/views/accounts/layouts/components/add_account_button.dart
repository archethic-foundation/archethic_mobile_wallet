import 'package:aewallet/application/session/session.dart';
import 'package:aewallet/ui/util/dimens.dart';
import 'package:aewallet/ui/views/add_account/layouts/add_account_sheet.dart';
import 'package:aewallet/ui/widgets/components/app_button_tiny.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddAccountButton extends ConsumerWidget {
  const AddAccountButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final session = ref.watch(sessionNotifierProvider).loggedIn;

    return AppButtonTinyConnectivity(
      localizations.addAccount,
      Dimens.buttonBottomDimens,
      key: const Key('addAccount'),
      onPressed: () async {
        await context.push(
          AddAccountSheet.routerPage,
          extra: session!.wallet.seed,
        );
      },
    );
  }
}
