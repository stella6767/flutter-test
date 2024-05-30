import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../config/color.dart';
import '../../config/grobal_variable.dart';
import '../../repository/client/retrofit_client.dart';

void networkErrorSnackbar(dynamic onError, dynamic handler) {
  final snackbar = SnackBar(
    padding: const EdgeInsets.only(
      top: 16,
      left: 24,
      bottom: 16,
    ),
    duration: const Duration(days: 1),
    dismissDirection: DismissDirection.none,
    content: const Text("check.network_error"),
    backgroundColor: CustomColors.gray009,
    behavior: SnackBarBehavior.floating,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12))),
    action: SnackBarAction(
      label: "would you retry?",
      textColor: CustomColors.blue008,
      onPressed: () async {
        await retrofitStatusError(onError: onError, handler: handler);
      },
    ),
  );
  ScaffoldMessenger.of(GlobalVariable.navigatorState.currentContext!)
      .showSnackBar(snackbar);
}


