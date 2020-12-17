import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:vibration/vibration.dart';

class Helper {
  showToastMessage(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  goToPage(BuildContext context, Widget child) {
    Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: child,
        ));
  }

  goBack(
    BuildContext context,
  ) {
    Navigator.pop(context);
  }

  showSnackBar(message, title, context, bool error) {
    return Flushbar(
      title: title,
      message: message,
      backgroundColor: error ? Colors.orange : Theme.of(context).accentColor,
      reverseAnimationCurve: Curves.easeIn,
      forwardAnimationCurve: Curves.easeInOut,
      duration: Duration(seconds: 5),
      margin: EdgeInsets.all(8),
      borderRadius: 8,
    )..show(context);
  }

  showLoadingDilog(context) {
    ProgressDialog pr = ProgressDialog(context);
    pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
    pr.style(
        message: 'Loading..',
        padding: EdgeInsets.all(16.0),
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: Container(
            padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
        elevation: 6.0,
        insetAnimCurve: Curves.easeInOut,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 19.0,
          fontWeight: FontWeight.w600,
        ));
    return pr;
  }

  // ignore: missing_return
  String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return "₹ " + value;
    }
  }

  vibratPhone() {
    Vibration.vibrate(duration: 200);
  }
}
