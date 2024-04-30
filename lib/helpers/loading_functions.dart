import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

mixin LoadingFunctions  {

  void showLoading() async{
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.custom,
    );
    if (kDebugMode) {
      print('EasyLoading show');
    }

  }

  showLoadingError(error) async{
    EasyLoading.showError(error);
  }

  showLoadingSuccess() async{
    await EasyLoading.showSuccess("success");
  }


}
