import 'package:shadcn_ui/src/annotations.dart';

part 'test_model.g.dart';

@Serializable()
class Person {
  final String name;
  final int age;
  final Address address;
  final List<String> hobbies;

  Person(this.name, this.age, this.address, this.hobbies);

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}

@Serializable()
class Address {
  final String street;
  final String city;

  Address(this.street, this.city);

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
