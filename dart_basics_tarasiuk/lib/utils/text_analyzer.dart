import 'dart:io';

void main() {
  print('Введіть текст для аналізу:');
  String text = stdin.readLineSync()!;

  final result = analyzeText(text);

  print('Кількість символів: ${result['charCount']}');
  print('Кількість слів: ${result['wordCount']}');
}

Map<String, int> analyzeText(String text) {
  final charCount = text.trim().replaceAll(RegExp(r'\s'), '').length;
  final wordCount = text
      .trim()
      .split(RegExp(r'\s+'))
      .where((word) => word.isNotEmpty)
      .length;

  return {
    'charCount': charCount,
    'wordCount': wordCount
  };
}