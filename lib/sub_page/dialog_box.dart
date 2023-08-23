import 'package:flutter/material.dart';

class DialogBox {
  DialogBox(this.context);
  final BuildContext context;
  void showErrorDialogBox(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white.withOpacity(0.2),
            title: const Text(
              'Login Failed',
            ),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () {
                  if (FocusScope.of(context).hasFocus) {
                    FocusScope.of(context).unfocus();
                  }
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  void showSuccessDialogBox(String successMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white.withOpacity(0.2),
            title: const Text(
              'Registration Success',
            ),
            content: Text(successMessage),
            actions: [
              TextButton(
                onPressed: () {
                  if (FocusScope.of(context).hasFocus) {
                    FocusScope.of(context).unfocus();
                  }
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  Future<void> showTempDialogBox() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.white.withOpacity(0.2),
              title: const Text(
                '',
              ),
              content: const Text(
                'Please wait...',
              ));
        });
  }
}
