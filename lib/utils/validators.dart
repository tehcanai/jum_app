import 'package:get/get.dart';

class Validators {
  static String? Function(String?)? required = (value) {
    {
      if (value == null || value.isEmpty) {
        return 'Please fill in this field';
      }
      return null;
    }
  };

  static String? Function(String?)? email = (value) {
    {
      if (value == null || value.isEmpty) {
        return 'Please fill in this field';
      }
      if (!value.contains('@')) {
        return 'Please enter a valid email';
      }
      return null;
    }
  };

  static String? Function(String?)? password = (value) {
    {
      if (value == null || value.isEmpty) {
        return 'Please fill in this field';
      }
      if (value.length < 8) {
        return 'Please enter a valid password that is at least 8 characters long';
      }
      return null;
    }
  };

  static String? Function(String?)? phone = (value) {
    {
      if (value == null || value.isEmpty) {
        return 'Please fill in this field';
      }
      if (!value.isNum) {
        return 'Please enter a valid phone number';
      }
      if (value.length < 11) {
        return 'Please enter a valid phone number';
      }
      return null;
    }
  };
}
