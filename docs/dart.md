# Lab 2: Dart exercises (DartPad)

## Step 1: price function
```dart
double price({
  required double unit,
  required int quantity,
  double discount = 0,
}) {
  return unit * quantity - discount;
}

void main() {
  print(price(unit: 100, quantity: 3));
  print(price(unit: 100, quantity: 3, discount: 20));
  print(price(quantity: 2, unit: 50, discount: 10));
}
```
Output:
```
300.0
280.0
90.0
```
Explanation: price() uses named parameters. unit and quantity are required, discount defaults to 0. I called it three times: without a discount, with a discount, and with the parameters in a different order.

## Step 2: findTown
```dart
String? findTown(String code) {
  const towns = {'YDE': 'Yaoundé', 'DLA': 'Douala'};
  return towns[code];
}

void main() {
  print(findTown('YDE') ?? 'Unknown town');
  print(findTown('XXX') ?? 'Unknown town');
}
```
Output:
```
Yaoundé
Unknown town
```
Explanation: findTown returns String?, so it can return null. The map gives null for an unknown code like XXX. The ?? operator prints "Unknown town" when the value is null, so the program does not crash.

## Step 3: where, map, fold
```dart
void main() {
  final prices = [120.0, 450.0, 600.0, 750.0, 980.0];

  final above500 = prices.where((p) => p > 500).toList();
  final increased = prices.map((p) => p * 1.10).toList();
  final total = prices.fold(0.0, (sum, p) => sum + p);

  print('Above 500: $above500');
  print('+10%: $increased');
  print('Total: $total');
}
```
Output:
```
Above 500: [600.0, 750.0, 980.0]
+10%: [132, 495.00000000000006, 660, 825.000000000001, 1078]
Total: 2900.0
```
Explanation: where keeps only the prices above 500, map creates a new list with each price increased by 10 percent, and fold adds all the prices into one total. The long decimals come from floating-point arithmetic.

## Step 4: Product class and async
```dart
class Product {
  final String name;
  final double price;

  const Product(this.name, this.price);

  double get priceWithVat => price * 1.1925;

  String describe() => '$name costs $price, with VAT: $priceWithVat';
}

Future<String> loadMessage() async {
  await Future.delayed(const Duration(seconds: 1));
  return 'Data loaded after 1 second';
}

void main() async {
  const p = Product('Notebook', 500);
  print(p.describe());
  print(await loadMessage());
}
```
Output:
```
Notebook costs 500.0, with VAT: 596.25
Data loaded after 1 second
```
Explanation: Product has a const constructor, a getter (priceWithVat) and a describe() method. loadMessage() is async and waits one second with await, which pauses only that function, not the whole app.