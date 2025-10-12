enum Skill { FLUTTER, DART, OTHER }

class Employee {
  final String _name;
  double _baseSalary = 40000;
  final List<Skill> _skills = Skill.values; //to get all enum value into list
  final List< Map<String, Object>> _address;
  final int? _yearOfExperience;

  Employee(
    this._name,
    this._baseSalary,
    List<Skill> skills,
    this._address,
    this._yearOfExperience,
  );
  //get of private variable
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  List<Map<String, Object>> get address => _address;

  //when the value is nullable
  int? get yearOfExperience => _yearOfExperience;

  void printDetails() {
    // print('Employee: $name, Base Salary: \$${baseSalary}');
    print("Name: $_name");
    print("BaseSalary: $_baseSalary");
    print("Year of exerprice: $_yearOfExperience");
    print("Skill: ${_skills.map((s) => s.name).join(',')}");
    print("Address: $_address");
    print("Total salary: ${computeSaraly()}");
  }

  double computeSaraly() {
    double totalSalary = _baseSalary;
    if (_yearOfExperience != null) {
      totalSalary += _yearOfExperience * 2000;
    }
    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          totalSalary += 5000;
          break;

        case Skill.DART:
          totalSalary += 3000;
          break;

        case Skill.OTHER:
          totalSalary += 1000;
          break;
      }
    }
    return totalSalary;
  }

}

void main() {
  var emp1 = Employee(
    'Sokea',
    40000,
    [Skill.DART],
    [
      {"Street": 4, "City": "Phnom Penh", "Zipcode": 1234},
    ],
    3,
  );
  emp1.printDetails();

  var emp2 = Employee('Ronan', 45000,[Skill.FLUTTER],[{"Street": 6, "City": "Phnom Penh", "Zipcode": 123450}],4,);
  emp2.printDetails();
}
