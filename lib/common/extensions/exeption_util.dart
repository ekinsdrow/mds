import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ExceptionStringifier on Exception {
  String toExceptionString(BuildContext context) {
    final exeption = this;
    if (exeption is TimeoutException) {
      return AppLocalizations.of(context)!.timeout_error;
    } else if (exeption is DioError) {
      if (exeption.response != null) {
        if (exeption.response!.statusCode == 500) {
          return AppLocalizations.of(context)!.server_error;
        }
      }
      
      return AppLocalizations.of(context)!.network_error;
    }

    return AppLocalizations.of(context)!.unknown_error;
  }
}
