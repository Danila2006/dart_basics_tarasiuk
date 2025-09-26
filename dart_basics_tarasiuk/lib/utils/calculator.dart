import 'dart:io';

void main() {
  print('=== Calculator ===');

  stdout.write('Введіть перше число: ');
  double num1 = double.parse(stdin.readLineSync()!);

  stdout.write('Введіть друге число: ');
  double num2 = double.parse(stdin.readLineSync()!);

  print('Оберіть операцію (+, -, *, /): ');
  String operation = stdin.readLineSync()!;

  double result = calculate(num1, num2, operation);

  print('Результат: $result');
}

double calculate(double num1, double num2, String operation) {
  switch (operation) {
    case '+': return num1 + num2;
    case '-': return num1 - num2;
    case '*': return num1 * num2;
    case '/': 
      if (num2 != 0) {
        return num1 / num2;
      }
      throw Exception('Помилка: ділення на нуль');
    default: throw Exception('Невідома операція');
  }
}