enum RoleEnum {
  admin,
  hr,
  manager,
  accountant;

  String get title => switch (this) {
    admin => 'Admin',
    hr => 'HR',
    manager => 'Manager',
    accountant => 'Accountant',
  };
}

enum UserEnum {
  admin,
  hr,
  manager;

  String get title => switch (this) {
    admin => 'Admin',
    hr => 'HR only',
    manager => 'Manager',
  };
}
