import 'dart:io';

void main() {
  Map PersonDetails = {
    "name": Null,
    "age": Null,
    "gender": Null,
    "city": Null,
    "state": Null,
    "country": Null,
    "email": Null,
    "phone": Null,
    "address": Null,
    "Education": Null,
  };

  for (String key in PersonDetails.keys) {
    stdout.write("Enter your $key : ");
    PersonDetails[key] = stdin.readLineSync();
  }
  print("");
  for (String key in PersonDetails.keys) {
    stdout.write(" $key is : ${PersonDetails[key]}\n");
  }
}