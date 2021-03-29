class DummyPersons {
  String city;
  String name;

  DummyPersons({this.city, this.name});

  DummyPersons.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['name'] = this.name;
    return data;
  }
}

class OnlyDummyPerson {
  String city;
  String name;

  OnlyDummyPerson({this.city, this.name});

  OnlyDummyPerson.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['name'] = this.name;
    return data;
  }
}