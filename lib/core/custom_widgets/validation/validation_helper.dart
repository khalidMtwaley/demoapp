import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../locale/app_locale_key.dart';

class ValidationHelper {
  // ---------- NAME ----------
  String? validateName(String? value) {
    final RegExp nameRegExp = RegExp(r'[a-zA-Z]');
    if (value == null || value.trim().isEmpty) {
      return tr(AppLocaleKey.validateName);
    } else if (!nameRegExp.hasMatch(value)) {
      return tr(AppLocaleKey.validateName);
    }
    return null;
  }

  // ---------- EMAIL ----------
  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return tr(AppLocaleKey.validateEmail);
    } else if (!_emailValidationStructure(value.trim())) {
      return tr(AppLocaleKey.validateEmailStructure);
    }
    return null;
  }

  bool _emailValidationStructure(String email) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  // ---------- PHONE (Saudi) ----------
  String? validatePhoneSa(String? value) {
    if (value == null || value.isEmpty) {
      return tr(AppLocaleKey.validatePhone);
    }
    if (!value.validateSaudiPhoneNumber()) {
      return tr(AppLocaleKey.validatePhone);
    } else {
      return null;
    }
  }

  // ---------- PASSWORD ----------
  String? validatePassword(String? value) {
    if (value == null || value.trim().length < 8) {
      return tr(AppLocaleKey.validatePassword);
    } else if (!validatePasswordStructure(value)) {
      return tr(AppLocaleKey.passwordStructureValidation);
    }
    return null;
  }

  // ---------- NEW PASSWORD ----------
  String _password = '';
  String? validateNewPassword(String? value) {
    _password = value ?? '';
    if (value == null || value.trim().length < 8) {
      return tr(AppLocaleKey.validatePassword);
    } else if (!validatePasswordStructure(value)) {
      return tr(AppLocaleKey.passwordStructureValidation);
    }
    return null;
  }

  bool validatePasswordStructure(String value) {
    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  // ---------- CONFIRM PASSWORD ----------
  String? validateConfirmPassword(String? value) {
    if (value == null || value.trim().length < 8) {
      return tr(AppLocaleKey.validatePassword);
    } else if (_password != value) {
      return tr(AppLocaleKey.validateConfirmPassword);
    }
    return null;
  }

  // ---------- EMPTY FIELD ----------
  String? validateEmptyField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return tr(AppLocaleKey.validateEmpty);
    }
    return null;
  }

  // ---------- EMPTY DROPDOWN ----------
  String? validateEmptyDropDown(dynamic value) {
    if (value == null) {
      return tr(AppLocaleKey.validateEmpty);
    }
    return null;
  }

  // ---------- EMPTY MULTISELECT ----------
  String? validateEmptyMultiSelect(List<dynamic>? value) {
    if (value == null || value.isEmpty) {
      return tr(AppLocaleKey.validateEmpty);
    }
    return null;
  }
}

// ---------- Helpers ----------
bool hasMatch(String? s, String p) {
  return (s == null) ? false : RegExp(p).hasMatch(s);
}

extension StringExtension on String? {
  bool validateSaudiPhoneNumber() => hasMatch(this, r'^5[0-9]{8}$');
}
