/// SPDX-License-Identifier: AGPL-3.0-or-later

// Package imports:
import 'package:event_taxi/event_taxi.dart';

class TransactionSendEvent implements Event {
  TransactionSendEvent({this.nbConfirmations, this.response});

  final int? nbConfirmations;
  final String? response;
}
