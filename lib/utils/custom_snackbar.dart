import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_management/app_constant.dart';

class CustomSnackBar {
  static final CustomSnackBar _singleton = CustomSnackBar._internal();

  CustomSnackBar._internal();

  factory CustomSnackBar() {
    return _singleton;
  }

  /// Snackbarın UI'da kaç saniye kalıcağını belirler
  final Duration _hangDurationTime = const Duration(seconds: 3);

  /// Snackbarın padding değeri
  final EdgeInsets _snackbarPadding = const EdgeInsets.all(40);

  /// Snackbarın margin değeri
  final EdgeInsets _snackbarMargin = const EdgeInsets.all(8);

  /// Başarılı İkonu
  final Icon _successIcon = const Icon(Icons.check_circle_outline,
      color: kSnackbarOKColor, size: kIconSizeSnackbar);

  /// Hata İkonu
  final Icon _errorIcon = const Icon(Icons.error_outline_rounded,
      color: kRedColor, size: kIconSizeSnackbar);

  /// Uyarı  İkonu
  final Icon _warningIcon = const Icon(Icons.warning_amber_rounded,
      color: kOrangeColor, size: kIconSizeSnackbar);

  ///Kapat butonu
  final TextButton _closeButton = TextButton(
    onPressed: () => Get.closeAllSnackbars(),
    child: const Text(
      "Kapat",
      style: TextStyle(color: kWhiteColor),
    ),
  );

  ///Kullanıcıya başarılı bir işlem yaptıysa gösterilecek snackbar.
  Future<void> success(String snackbarMessage) async {
    if (Get.context != null) {
      if (Get.isSnackbarOpen) {
        await Get.closeCurrentSnackbar();
      }

      Get.snackbar(
        "BAŞARILI",
        borderRadius: kBorderRadiusCircularValue,
        snackbarMessage,
        icon: _successIcon,
        padding: _snackbarPadding,
        snackPosition: SnackPosition.TOP,
        shouldIconPulse: true,
        backgroundColor: kSnackbarBGColor,
        colorText: kWhiteColor,
        margin: _snackbarMargin,
        duration: _hangDurationTime,
        mainButton: _closeButton,
      );
    }
  }

  ///Unhandled Error - Kullanıcı hatalı bir işlem yaptıysa gösterilecek snackbar.
  Future<void> error(String snackbarMessage) async {
    if (Get.context != null) {
      if (Get.isSnackbarOpen) {
        await Get.closeCurrentSnackbar();
      }

      Get.snackbar(
        "HATA",
        borderRadius: kBorderRadiusCircularValue,
        snackbarMessage,
        padding: _snackbarPadding,
        icon: _errorIcon,
        snackPosition: SnackPosition.TOP,
        shouldIconPulse: true,
        backgroundColor: kSnackbarBGColor,
        colorText: kWhiteColor,
        margin: _snackbarMargin,
        duration: _hangDurationTime,
        mainButton: _closeButton,
      );
    }
  }

  ///Handled Error - Kullanıcı hatalı bir işlem yaptıysa gösterilecek snackbar.
  Future<void> warning(String snackbarMessage) async {
    if (Get.context != null) {
      if (Get.isSnackbarOpen) {
        await Get.closeCurrentSnackbar();
      }

      Get.snackbar(
        "Uyarı",
        borderRadius: kBorderRadiusCircularValue,
        snackbarMessage,
        padding: _snackbarPadding,
        icon: _warningIcon,
        snackPosition: SnackPosition.TOP,
        shouldIconPulse: true,
        backgroundColor: kSnackbarBGColor,
        colorText: kWhiteColor,
        margin: _snackbarMargin,
        duration: _hangDurationTime,
        mainButton: _closeButton,
      );
    }
  }
}

final customSnackBar = CustomSnackBar();
