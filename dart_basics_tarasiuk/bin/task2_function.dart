void main() {
  print('=== Dart Function Demo ===');

  testBasicFunctions();
  testAdvancedFunctions();
  testFunctionalProgramming();
}

int calculateSum(int a, int b) {
  return a + b;
}

double calculateAverage(List<double> numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  double sum = numbers.reduce((a, b) => a + b);
  return sum / numbers.length;
}

String formatName(String firstName, String lastName,
{String? middleName, bool uppercase = false}) {
  String fullName = middleName == null
      ? "$firstName $lastName"
      : "$firstName $middleName $lastName";

  return uppercase ? fullName.toUpperCase() : fullName;
}

void testFunctionalProgramming() {
  print('\n=== Functional Programming Demo ===');
  
  List<int> nums = [1, 2, 3, 4, 5, 6];

  //map
  var squares = nums.map((n) => n * n).toList();
  print('Squares: $squares');

  //where
  var even = nums.where((n) => n.isEven).toList();
  print('Even numbers: $even');

  //Closure
  Function makeMultiplier(int factor) {
    return (int x) => x * factor;
  }

  var doubleIt = makeMultiplier(2);
  var tripleIt = makeMultiplier(3);

  print('Double 5: ${doubleIt(5)}');
  print('Triple 5: ${tripleIt(5)}');
}

int fibonacci(int n) {
  if (n <= 1) {
    return n;
  }

  return fibonacci(n - 1) + fibonacci(n - 2);
}

int factorial(int n) {
  if (n <= 1) {
    return 1;
  }

  return n * factorial(n - 1);
}

void testBasicFunctions() {
  print('\n=== Basic Functions Demo ===');
  print('Sum(3, 7): ${calculateSum(3, 7)}');
  print('Average of [2, 4, 6, 8]: ${calculateAverage([2, 4, 6, 8])}');
}

void testAdvancedFunctions() {
  print('\n=== Advanced Functions Demo ===');
  print(formatName("John", "Doe"));
  print(formatName("Jane", "Smith", middleName: "Mary"));
  print(formatName("Bob", "Marley", uppercase: true));

  print('Factorial(5): ${factorial(5)}');
  print('Fibonacci(6): ${fibonacci(6)}');
}