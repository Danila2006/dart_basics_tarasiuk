void main() {
  print('=== Dart Variables & Types Demo ===');

  demonstrateNumbers();
  demonstrateStrings();
  demonstrateBooleans();
  demonstrateCollections();
  demonstrateNullSafety();
}

void demonstrateNumbers() {
  print('=== demonstrateNumbers menthod ===');
  //Приклад числових типів
  int a = 17;
  double b = 3.85;
  num c = 8;

  print('int: $a');
  print('double: $b');
  print('num: $c');

  //Математичні операції
  print('Додавання: ${a + c}');
  print('Віднімання: ${a - c}');
  print('Множення: ${a * c}');
  print('Ділення: ${a / c}');  //всегда возвращает double
  print('Залишок: ${a % 3}');
  print('Зведення у ступінь: ${a * a}');

  //Type conversion
  double d = a.toDouble();
  int e = b.toInt();
  print('int -> double: $d');
  print('double -> int: $e');
}

void demonstrateStrings() {
  print('=== demonstrateStrings menthod ===');
  //Створення рядків та інтерполяція
  String name = 'Danil';
  int age = 18;
  print('Hello, I\'m $name! I\'m $age years old');

  //Багаторядкові рядки та escape-послідовності
  String multiLine = '''
This is a multi-line string.
It can span multiple lines.
''';
  print(multiLine);

  //Методи рядків
  String text = 'Moon is perfect';
  print('Length: ${text.length}');
  print('Uppercase: ${text.toUpperCase()}');
  print('Lowercase: ${text.toLowerCase()}');
  print('Contains "is": ${text.contains("is")}');
  print('Replace "perfect" with "good": ${text.replaceAll("perfect", "good")}');
  print('Substring (0, 4): ${text.substring(0, 4)}');
  print('Split by space: ${text.split(" ")}');
}

void demonstrateBooleans() {
  print('=== demonstrateBooleans method ===');
  //Бульові значення
  bool isCppHard = true;
  bool isJavaHard = false;
  print('isCppHard: $isCppHard');
  print('isJavaHard: $isJavaHard');

  //Порівняння
  int a = 10;
  int b = 20;
  print('a == b: ${a == b}');
  print('a != b: ${a != b}');
  print('a < b: ${a < b}');
  print('a > b: ${a > b}');
  print('a <= b: ${a <= b}');
  print('a >= b: ${a >= b}');

  //Логічні операції
  bool condition1 = a < b;
  bool condition2 = b < 15;

  print('condition1 && condition2: ${condition1 && condition2}');
  print('condition1 || condition2: ${condition1 || condition2}');
  print('!condition1: ${!condition1}');
}

void demonstrateCollections() {
  print('=== demonstrateCollections method ==');
  //List
  List<int> nums = [1, 2, 3, 4];
  nums.add(5);
  nums.remove(2);
  print('List: $nums');
  print('First: ${nums.first}, Last: ${nums.last}');
  print('Contains 3: ${nums.contains(3)}');
  print('Reversed: ${nums.reversed.toList()}');

  //Set
  Set<String> fruits = {'apple', 'banana', 'orange'};
  fruits.add('banana'); //не додасться
  fruits.add('kiwi');
  print('Set: $fruits');
  print('Contains "apple": ${fruits.contains("apple")}');
  fruits.remove('orange');
  print('After remove: $fruits');

  //Map
  Map<String, int> ages = {
    'Alice': 25,
    'Bob': 30,
  };
  ages['Charlie'] = 35;
  print('Map: $ages');
  print('Bob\'s age: ${ages['Bob']}');
  print('Keys: ${ages.keys}');
  print('Values: ${ages.values}');
  print('Contains key "Alice": ${ages.containsKey("Alice")}');
}

void demonstrateNullSafety() {
  //Nullable типи
  String? nullableString; //може бути null
  String nonNullable = 'Hello'; //не може бути null

  print('nullableString: $nullableString');
  print('nonNullable: $nonNullable');

  //Null-aware оператори
  String? name;
  print('Ім\'я або "Unknown": ${name ?? "Unknown"}'); //оператор ??

  name ??= "Alice"; //якщо name == null, присвоїти "Alice"
  print('Після ??= : $name');

  //Безпечний виклик методу (якщо null, то нічого не виконається)
  print('Довжина name: ${name.length}');

  //late змінні
  late int value;
  value = 42; // ініціалізація пізніше
  print('late value: $value');

  //required параметри
  greetUser(name: 'Bob');
}

// Функцічя з required параметром
void greetUser({required String name}) {
  print('Hello, $name!');
}