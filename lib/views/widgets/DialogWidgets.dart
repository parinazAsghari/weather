import 'package:flutter/material.dart';

import '../../constants.dart';

class MessageDialogWidget extends StatelessWidget {
  var title, body, dismissable, positiveTxt, hasTextBody;
  Function? positiveFunc;
  Widget? widget;
  final double? height;
  final double? width;

  MessageDialogWidget({
    this.title,
    this.body,
    this.dismissable = false,
    this.positiveTxt,
    this.positiveFunc,
    this.hasTextBody = true,
    this.widget,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return new Future(() => dismissable);
      },
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,

        // contentPadding: EdgeInsets.all(0),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        // titlePadding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0),
        // actionsPadding: EdgeInsets.all(0),
        content: Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            height: height ?? 240,
            width: width ?? 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if(dismissable)GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(top: 8, end: 8),
                    alignment: AlignmentDirectional.topEnd,
                    child: CircleAvatar(
                      radius: 11,
                      backgroundColor: dark_theme_secondary,
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                ),

                if(hasTextBody)Center(
                    child: Container(
                      height: 100,
                      alignment: AlignmentDirectional.center,
                      margin: const EdgeInsetsDirectional.only(
                        top: 10,
                      ),
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "$body",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),

                Expanded(child: hasTextBody? Container() : widget!),

                // Expanded(child: Container()),
                GestureDetector(
                  // hoverColor: Colors.transparent,
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).pop(null);
                    if (positiveFunc != null) {
                      positiveFunc!();
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 152,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: dark_theme_secondary
                    ),
                    margin: const EdgeInsets.only(
                        left: 20, top: 0, right: 20, bottom: 10),
                    child: Text(
                      '$positiveTxt',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
