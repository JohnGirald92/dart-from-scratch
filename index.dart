import 'dart:io';

void main() {
  print('¡Hola  Bienvenido al calculador de años.');
  print('Escribe tu nombre: ');
  String? nameImput = stdin.readLineSync();
  print('Un gusto conocerte $nameImput');
  print('Escribe tu fecha de nacimiento en formato dd/mm/yyyy: ');
  String? birthdayImput = stdin.readLineSync();
  DateTime? dateConverted = _convertToDateTime(birthdayImput!);
  if (dateConverted == null) {
    print('la fecha de nacimiento es inválida, nos enviaste: $birthdayImput');
    return;
  }

  var person = Person(
    name: nameImput,
    birthday: dateConverted,
    age: DateTime.now().year - dateConverted.year,
  );

  print('Tu nombre: ${person.name}');
  print('Tu fecha de nacimiento: ${person.birthday}');
  print('Tu edad es: ${person.age} años!');
}

DateTime? _convertToDateTime(String date) {
  List<String> parts = date.split('/');
  if (parts.length != 3) return null;
  return DateTime.tryParse('${parts[2]}-${parts[1]}-${parts[0]}');
}

class Person {
  final String? name;
  final DateTime? birthday;
  final int? age;
  Person({this.name, this.birthday, this.age});
}
