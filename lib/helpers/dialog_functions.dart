import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

mixin DialogFunctions  {
  showSuccessDialog(BuildContext context){
    AwesomeDialog(
      context: context,
      animType: AnimType.leftSlide,
      headerAnimationLoop: false,
      dialogType: DialogType.success,
      showCloseIcon: true,
      title: 'Succes',
      desc:
      'Dialog description here..................................................',
      btnOkOnPress: () {
        debugPrint('OnClcik');
      },
      btnOkIcon: Icons.check_circle,
      onDismissCallback: (type) {
        debugPrint('Dialog Dissmiss from callback $type');
      },
    ).show();
  }

  showWarningDialog(BuildContext context, description){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      closeIcon: const Icon(Icons.close_fullscreen_outlined),
      title: 'Info',
      desc:
      description,
      btnCancelOnPress: () {},
      onDismissCallback: (type) {
        debugPrint('Dialog Dismiss from callback $type');
      },
      btnOkOnPress: () {},
    ).show();
  }

}
