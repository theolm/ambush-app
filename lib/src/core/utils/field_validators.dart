String? requiredFieldValidator(String? value) {
  if(value == null || value.isEmpty) {
    return "Required filed";
  }
  return null;
}

String? doubleValueValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Required filed";
  }

  if (double.tryParse(value) == null) {
    return "Invalid value";
  }

  return null;
}

String? requiredEmailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Required filed";
  }

  if (!value.contains("@")) {
    return "Invalid email";
  }

  return null;
}
