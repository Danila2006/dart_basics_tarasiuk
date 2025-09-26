import 'dart:io';

void main() {
  print('Введіть текст для аналізу:');
  String text = stdin.readLineSync()!;

  int charCount = text.length;

  List<String> words = text.split(RegExp(r'\s+'));
  int wordCount = words.where((word) => word.isNotEmpty).length;

  print('Кількість символів: $charCount');
  print('Кількість слів: $wordCount');
}