/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:aewallet/application/account/accounts_notifier.dart';
import 'package:aewallet/ui/themes/styles.dart';
import 'package:aewallet/ui/views/nft/layouts/components/nft_list_detail.dart';
import 'package:aewallet/ui/widgets/components/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NFTList extends ConsumerStatefulWidget {
  const NFTList({super.key});

  @override
  ConsumerState<NFTList> createState() => _NFTListState();
}

class _NFTListState extends ConsumerState<NFTList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final selectedAccount = ref
        .watch(
          accountsNotifierProvider,
        )
        .valueOrNull
        ?.selectedAccount;
    if (selectedAccount == null) {
      return const _EmptyNFTList();
    }

    final accountTokenList = [
      ...selectedAccount.accountNFT ?? [],
      ...(selectedAccount.accountNFTCollections?.where(
            (e) => <String>{}.add(e.tokenInformation?.address ?? ''),
          ) ??
          []),
    ];

    if (accountTokenList.isEmpty) {
      return const _EmptyNFTList();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: DynamicHeightGridView(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 40,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: accountTokenList.length,
        builder: (context, index) {
          if (accountTokenList[index].tokenInformation == null) {
            return const SizedBox.shrink();
          }
          final tokenInformation = accountTokenList[index].tokenInformation!;
          return NFTListDetail(
            address: tokenInformation.address ?? '',
            name: tokenInformation.name ?? '',
            properties: tokenInformation.tokenProperties ?? {},
            symbol: tokenInformation.symbol ?? '',
            tokenId: tokenInformation.id ?? '',
            collection: tokenInformation.tokenCollection ?? [],
            index: index,
            roundBorder: true,
          );
        },
      ),
    );
  }
}

class _EmptyNFTList extends StatelessWidget {
  const _EmptyNFTList();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          Text(
            localizations.nftListEmptyExplanation,
            style: ArchethicThemeStyles.textStyleSize12W100Primary,
          ),
        ],
      ),
    );
  }
}
