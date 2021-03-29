enum SecureKeys {
  userId,
  accountKey,
  subscriptionType,
}

extension SecureKeysExtension on SecureKeys {
  static const values = {
    SecureKeys.accountKey: 'accountKey',
    SecureKeys.userId: 'userId',
    SecureKeys.subscriptionType: 'subscriptionType',
  };

  String get value => values[this];
}