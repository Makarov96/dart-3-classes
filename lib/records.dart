var jsonUser = {
  'combine': ['green', 27],
  'name': 'Steven',
  'complex': {
    'combine': [19.8, true, 'is correct']
  }
};

void main() {
  final userFromFactory = UserModel.fromJson(jsonUser);
  final userRecrods = UserModel.user(jsonUser);

  print(userFromFactory.toString());
  print(userRecrods.name);
  print(userRecrods.color);

  print(userRecrods.complex.messure);
}

class UserModel {
  const UserModel({
    required this.name,
    required this.color,
    required this.age,
  });
  final String name;
  final String color;
  final int age;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    int age = 0;
    String color = '';
    if (json.length == 2) {
      color = json['combine'][0];
      age = json['combine'][1];
    }

    return UserModel(
      name: json['name'],
      color: color,
      age: age,
    );
  }

  static ({
    String name,
    String color,
    int age,
    ({double messure, bool isValid, String status}) complex,
  }) user(Map<String, dynamic> json) {
    String colorVal = '';
    int ageVal = 0;
    switch (json) {
      case {'combine': [String color, int age]}:
        colorVal = color;
        ageVal = age;
    }
    return (
      name: json['name'],
      color: colorVal,
      age: ageVal,
      complex: Complex.complex(json['complex'])
    );
  }

  @override
  String toString() => 'UserModel(name:$name, color:$color, age:$age)';
}

class Complex {
  const Complex({
    required this.messarue,
    required this.isValid,
    required this.status,
  });
  final double messarue;
  final bool isValid;
  final String status;

  static ({double messure, bool isValid, String status}) complex(
      Map<String, dynamic> json) {
    ({double messure, bool isValid, String status}) patternMachin =
        (messure: 0.0, isValid: false, status: '');
    switch (json) {
      case {'combine': [double messure, bool isValid, String status]}:
        patternMachin = (messure: messure, isValid: isValid, status: status);
    }

    return patternMachin;
  }
}
