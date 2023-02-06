import 'package:flutter/material.dart';
import 'package:mc_crud_test/presentation/theme/colory.dart';
import 'package:mc_crud_test/presentation/theme/icony.dart';

enum FlushBarType {
  success,
  error,
  warning,
}

extension FlushBarTypeX on FlushBarType {
  T map<T>({
    required T Function(FlushBarType value) success,
    required T Function(FlushBarType value) error,
    required T Function(FlushBarType value) warning,
  }) {
    if (this == FlushBarType.success) {
      return success(this);
    } else if (this == FlushBarType.error) {
      return error(this);
    } else if (this == FlushBarType.warning) {
      return warning(this);
    } else {
      throw UnsupportedError('error');
    }
  }

  Color get color {
    switch (this) {
      case FlushBarType.success:
        return Colory.successColor;
      case FlushBarType.error:
        return Colory.dangerColor.shade400;
      case FlushBarType.warning:
        return Colory.neutralColor.shade600;
    }
  }

  String get icon {
    switch (this) {
      case FlushBarType.success:
        return Icony.success;
      case FlushBarType.error:
        return Icony.closeCircleBold;
      case FlushBarType.warning:
        return Icony.warning;
    }
  }
}
