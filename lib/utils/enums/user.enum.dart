enum UserType {
  barber,
  stylist,
  customer,
}

extension UserTypeExtension on UserType {
  static const values = {
    UserType.barber: 'barber',
    UserType.stylist: 'stylist',
    UserType.customer: 'customer',
  };

  String get value => values[this];
}

enum UserGender {
  female,
  male,
}

extension UserGenderExtension on UserGender {
  static const values = {
    UserGender.female: 'female',
    UserGender.male: 'male',
  };

  static const names = {
    UserGender.female: 'Femenino',
    UserGender.male: 'Masculino',
  };

  String get value => values[this];
  String get name => names[this];
}
