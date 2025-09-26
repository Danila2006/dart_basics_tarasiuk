import 'dart:io';

void main() {
  print('Введіть текст для аналізу:');
  String text = stdin.readLineSync()!;

  final result = analyzeText(text);

  print('Кількість символів: ${result['charCount']}');
  print('Кількість слів: ${result['wordCount']}');
}

Map<String, int> analyzeText(String text) {
  final charCount = text.length;
  final words = text.split(RegExp(r'\s+'));
  final wordCount = words.where((word) => word.isNotEmpty).length;

  return {
    'charCount': charCount,
    'wordCount': wordCount
  };
}