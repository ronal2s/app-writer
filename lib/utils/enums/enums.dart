enum SecureKeys {
  userId,
  accountKey,
  subscriptionType,
  fullname,
}

extension SecureKeysExtension on SecureKeys {
  static const values = {
    SecureKeys.accountKey: 'accountKey',
    SecureKeys.userId: 'userId',
    SecureKeys.subscriptionType: 'subscriptionType',
    SecureKeys.fullname: 'fullname'
  };

  String get value => values[this];
}
