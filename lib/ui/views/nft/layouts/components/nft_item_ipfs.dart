/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:aewallet/application/url/provider.dart';
import 'package:aewallet/localization.dart';
import 'package:aewallet/ui/views/nft/layouts/components/nft_item_error.dart';
import 'package:aewallet/ui/views/nft/layouts/components/nft_item_loading.dart';
import 'package:aewallet/ui/widgets/components/image_network_safe_widgeted.dart';
import 'package:aewallet/util/token_util.dart';
import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NFTItemIPFS extends ConsumerWidget {
  const NFTItemIPFS({
    super.key,
    required this.token,
    this.roundBorder = false,
  });

  final Token token;
  final bool roundBorder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalization.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FutureBuilder<String?>(
          future: TokenUtil.getIPFSUrlFromToken(
            token,
          ),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return NFTItemError(message: localizations.previewNotAvailable);
            }
            if (snapshot.hasData) {
              final ipfsFormattedUrl = ref.watch(
                UrlProvider.urlIPFSForWeb(
                  uri: snapshot.data,
                ),
              );

              return roundBorder == true
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: ImageNetworkSageWidgeted(
                        url: ipfsFormattedUrl,
                        errorMessage: 'Oops! The IPFS URL is not available.',
                      ),
                    )
                  : ImageNetworkSageWidgeted(
                      url: ipfsFormattedUrl,
                      errorMessage: 'Oops! The IPFS URL is not available.',
                    );
            } else {
              return const NFTItemLoading();
            }
          },
        )
      ],
    );
  }
}
