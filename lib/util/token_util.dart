/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:aewallet/util/mime_util.dart';
import 'package:pdfx/pdfx.dart';

class TokenUtil {
  static bool isTokenFile(Map<String, dynamic> properties) {
    return properties['content'] != null &&
        properties['content']['raw'] != null;
  }

  static bool isTokenIPFS(Map<String, dynamic> properties) {
    return properties['content'] != null &&
        properties['content']['ipfs'] != null;
  }

  static bool isTokenHTTP(Map<String, dynamic> properties) {
    return properties['content'] != null &&
        properties['content']['http'] != null;
  }

  static bool isTokenAEWEB(Map<String, dynamic> properties) {
    return properties['content'] != null &&
        properties['content']['aeweb'] != null;
  }

  static Future<Uint8List?> getImageDecodedForPdf(
    Uint8List valueFileDecoded,
  ) async {
    final pdfDocument = await PdfDocument.openData(
      valueFileDecoded,
    );
    final pdfPage = await pdfDocument.getPage(1);

    final pdfPageImage =
        await pdfPage.render(width: pdfPage.width, height: pdfPage.height);
    return pdfPageImage!.bytes;
  }

  static Future<Uint8List?> getImageDecoded(
    Uint8List valueFileDecoded,
    String typeMime,
  ) async {
    if (MimeUtil.isPdf(typeMime) == false) {
      return valueFileDecoded;
    }
    return getImageDecodedForPdf(valueFileDecoded);
  }

  static Future<Uint8List?> getImageFromToken(
    Map<String, dynamic> properties,
  ) async {
    Uint8List? valueFileDecoded;
    Uint8List? imageDecoded;
    if (properties.isNotEmpty) {
      valueFileDecoded = base64Decode(properties['content']['raw']);
    }

    if (valueFileDecoded == null) {
      return imageDecoded;
    }

    return getImageDecoded(valueFileDecoded, properties['type_mime']);
  }

  static String? getIPFSUrlFromToken(Map<String, dynamic> properties) {
    String? imageDecoded;

    if (properties.isNotEmpty) {
      imageDecoded = properties['content']['ipfs'];
    }
    return imageDecoded;
  }

  static String? getHTTPUrlFromToken(Map<String, dynamic> properties) {
    String? imageDecoded;

    if (properties.isNotEmpty) {
      imageDecoded = properties['content']['http'];
    }
    return imageDecoded;
  }

  static String? getAEWebUrlFromToken(Map<String, dynamic> properties) {
    String? imageDecoded;

    if (properties.isNotEmpty) {
      imageDecoded = properties['content']['aeweb'];
    }
    return imageDecoded;
  }
}
