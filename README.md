# Dart Practice

## 📌 Опис проекту
Цей проєкт реалізує серію навчальних завдань з мови програмування **Dart**.  
В ході виконання завдань реалізовані приклади роботи з:
- змінними, типами даних та функціями;
- об'єктно-орієнтованим програмуванням (класи, наслідування, поліморфізм);
- колекціями та обробкою даних;

Проєкт складається з кількох **консольних програм**, кожна з яких демонструє окремий аспект Dart.

## Встановлення Dart SDK
1. Завантажте та встановіть Dart SDK:  
   [https://dart.dev/get-dart](https://dart.dev/get-dart)

2. Перевірте встановлення:
   ```bash
   dart --version
3. Клонуйте репозиторій:
   git clone <>
   cd <>

## Опис завдань
### Завдання 2.1 – Змінні та типи даних

Ця програма демонструє основи роботи з **змінними, типами даних та колекціями** у Dart.

#### Основні можливості:
1. **Числові типи (`int`, `double`, `num`)**  
   - Приклади створення змінних: `int a = 17; double b = 3.85; num c = 8;`  
   - Математичні операції: додавання, віднімання, множення, ділення, залишок, піднесення до степеня  
   - Конверсія типів: `int -> double`, `double -> int`

2. **Рядки (`String`)**  
   - Створення рядків та інтерполяція: `Hello, I'm $name!`  
   - Багаторядкові рядки та escape-послідовності  
   - Методи рядків: `length`, `toUpperCase()`, `toLowerCase()`, `contains()`, `replaceAll()`, `substring()`, `split()`

3. **Булеві значення (`bool`)**  
   - Логічні змінні: `true/false`  
   - Порівняння чисел: `==, !=, <, >, <=, >=`  
   - Логічні операції: `&&, ||, !`

4. **Колекції**  
   - `List`: додавання/видалення елементів, доступ до першого/останнього елементу, перевернутий список  
   - `Set`: унікальні елементи, додавання/видалення, перевірка наявності  
   - `Map`: ключ-значення, додавання елементів, отримання ключів та значень, перевірка наявності ключа

5. **Null Safety**  
   - Nullable типи: `String? nullableString`  
   - Null-aware оператори: `??`, `??=`  
   - Безпечний виклик методів: `name?.length`  
   - `late` змінні для відкладеної ініціалізації  
   - `required` параметри у функціях
   - 
## Запуск програм
У проєкті деякі завдання реалізовані як **окремі Dart-скрипти** у папці `bin/`,  
інші — як **консольні програми/утиліти** у папці `lib/utils/`.
## Завдання 2 – Змінні, типи даних та функції
  dart run bin/task1_variables.dart
  dart run bin/task2_functions.dart
## Завдання 3 – ООП: Класи та об’єкти
  dart run bin/task3_classes.dart
## Завдання 4 – Колекції та управління даними
  dart run bin/task4_collections.dart

## Результати виконання програм
### Завдання 2.1
![Variables Demo](dart_basics_tarasiuk/lib/screenshots/task1_variables_part1.png)  
![Variables Demo](dart_basics_tarasiuk/lib/screenshots/task1_variables_part2.png)
![Variables Demo](dart_basics_tarasiuk/lib/screenshots/task1_variables_part3.png)
![Variables Demo](dart_basics_tarasiuk/lib/screenshots/task1_variables_part4.png)
*Файл: `task1_variables.dart`*

### Завдання 2.2
![Function Demo](dart_basics_tarasiuk/lib/screenshots/task2_function.png)  
*Файл: `task2_function.dart`*

### Завдання 2.3
#### Task 1 Calculator
![Calculator Demo](dart_basics_tarasiuk/lib/screenshots/calculator.png)  
*Файл: `calculator.dart`*

#### Task 2 Text Analyzer
![Text Analyzer Demo](dart_basics_tarasiuk/lib/screenshots/text_analyzer.png)  
*Файл: `text_analyzer.dart`*

### Завдання 3.3 – University Management System
![Classes Demo](dart_basics_tarasiuk/lib/screenshots/task3_classes_part1.png)
![Classes Demo](dart_basics_tarasiuk/lib/screenshots/task3_classes_part2.png)  
*Файл: `task3_classes.dart`*

### Завдання 4.1 – Колекції та обробка даних
![Collections Demo](dart_basics_tarasiuk/lib/screenshots/task4_collections_part1.png)  
![Collections Demo](dart_basics_tarasiuk/lib/screenshots/task4_collections_part2.png)  
*Файл: `task4_collections.dart`*

## Результати виконання тестів

### Models Test
![Models Test](dart_basics_tarasiuk/lib/screenshots/models_test.png)  
*Файл: `models_test.dart`*

### Utils Test
![Utils Test](dart_basics_tarasiuk/lib/screenshots/utils_test.png)  
*Файл: `utils_test.dart`*




