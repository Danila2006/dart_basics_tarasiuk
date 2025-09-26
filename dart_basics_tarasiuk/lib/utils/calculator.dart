import 'dart:io';

void main() {
  print('=== Calculator ===');

  stdout.write('Введіть перше число: ');
  double num1 = double.parse(stdin.readLineSync()!);

  stdout.write('Введіть друге число: ');
  double num2 = double.parse(stdin.readLineSync()!);

  print('Оберіть операцію (+, -, *, /): ');
  String operation = stdin.readLineSync()!;

  double result;

  switch (operation) {
    case '+': 
      result = num1 + num2;
      break;
    case '-':
      result = num1 - num2;
      break;
    case '*':
      result = num1 * num2;
      break;
    case '/':
      if (num2 != 0) {
        result = num1 / num2;
      } else {
        print('Помилка: ділення на нуль');
        return;
      }
      break;
    default:
      print('Невідома операція');
      return;
  }

  print('Результат: $result');
}