class AuthValidators {
  // Сообщения об ошибке
  static const String emailErrMsg =  "Некорректный адрес электронной почты";
  static const String passwordErrMsg = "Пароль должен состоять как минимум из 6 символов";
  static const String confirmPasswordErrMsg = "Пароли не совпадают";
  static const String userAlreadyExistsErrMsg = "Пользователь с данной электронной почтой уже зарегистрирован";

  // Валидатор наличия и позиции @ в электронке
  String? emailValidator(String? val) {
    final String email = val as String;

    // Почтна не может быть короче пяти символов
    if (email.length <= 4) return emailErrMsg;

    // У почты есть @
    final hasAtSymbol = email.contains('@');
    // Позиция @
    final indexOfAt = email.indexOf('@');
    final numbersOfAt = "@".allMatches(email).length;

    // Сообщения об ошибках
    if (!hasAtSymbol) return emailErrMsg;
    if (numbersOfAt != 1) return emailErrMsg;
    if (indexOfAt == 0 || indexOfAt == email.length - 1) return emailErrMsg;
    // if () return userAlreadyExistsErrMsg;
    // Ошибок нет
    return null;
  }

  // Валидатор пароля
  String? passwordVlidator(String? val) {
    final String password = val as String;

    if (password.isEmpty || password.length <= 7) return passwordErrMsg;

    return null;
  }

  // Подтверждение пароля
  String? confirmPasswordValidator(String? val, firstPasswordInpTxt) {
    final String firstPassword = firstPasswordInpTxt;
    final String secondPassword = val as String;

    // Если пусто и не совпадает по длине, то сразу ошибка
    if (firstPassword.isEmpty || 
        secondPassword.isEmpty ||
        firstPassword.length != secondPassword.length) {
      return confirmPasswordErrMsg;
    }

    // Пароли не совпадают
    if (firstPassword != secondPassword) return confirmPasswordErrMsg;

    return null;
  }
}
