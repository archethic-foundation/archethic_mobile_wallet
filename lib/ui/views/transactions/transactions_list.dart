import 'package:aewallet/application/account/accounts_notifier.dart';
import 'package:aewallet/application/recent_transactions.dart';
import 'package:aewallet/ui/themes/archethic_theme.dart';
import 'package:aewallet/ui/themes/styles.dart';
import 'package:aewallet/ui/views/transactions/components/transaction_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class TransactionsList extends ConsumerStatefulWidget {
  const TransactionsList({
    super.key,
  });

  @override
  ConsumerState<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends ConsumerState<TransactionsList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(
    BuildContext context,
  ) {
    super.build(context);

    final selectedAccount = ref.watch(
      accountsNotifierProvider.select(
        (accounts) => accounts.valueOrNull?.selectedAccount,
      ),
    );
    if (selectedAccount == null) {
      return const SizedBox.shrink();
    }
    final recentTransactionsAsync = ref.watch(
      recentTransactionsProvider(selectedAccount.genesisAddress),
    );

    return Column(
      children: [
        recentTransactionsAsync.when(
          skipLoadingOnRefresh: true,
          skipLoadingOnReload: true,
          data: (data) {
            if (data.isEmpty) {
              return _recentTransactionsEmpty(context);
            }

            return Column(
              children: data.map((transaction) {
                return TransactionDetail(
                  transaction: transaction,
                );
              }).toList(),
            );
          },
          error: (_, __) => const SizedBox.shrink(),
          loading: () => const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget _recentTransactionsEmpty(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ArchethicTheme.backgroundFungiblesTokensListCard,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      color: ArchethicTheme.backgroundFungiblesTokensListCard,
      child: Container(
        padding: const EdgeInsets.all(9.5),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Row(
          children: [
            const Icon(
              Symbols.info,
              size: 18,
              weight: IconSize.weightM,
              opticalSize: IconSize.opticalSizeM,
              grade: IconSize.gradeM,
            ),
            const SizedBox(width: 8),
            Text(
              AppLocalizations.of(context)!.recentTransactionsNoTransactionYet,
              style: ArchethicThemeStyles.textStyleSize12W100Primary,
            ),
          ],
        ),
      ),
    ),
  );
}
