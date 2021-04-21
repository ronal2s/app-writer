enum SecureKeys {
  userId,
  accountKey,
  subscriptionType,
  fullname,
  email,
  birthDate
}

extension SecureKeysExtension on SecureKeys {
  static const values = {
    SecureKeys.accountKey: 'accountKey',
    SecureKeys.userId: 'userId',
    SecureKeys.subscriptionType: 'subscriptionType',
    SecureKeys.email: 'email',
    SecureKeys.birthDate: 'birthDate'
  };

  String get value => values[this];
}
