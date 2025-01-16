void main() {
  // print('Hello, World!');
  var name = 'Simpson';
  // name = 1 // var 변수는 
  String name2 = 'Simpson';

  // var를 사용하는 경우 : 함수나 클래스 내부에서 변수를 선언할 때
  // 타입을 명시하하는 경우 : class 내부에서 변수를 선언할 때 or property 선언할 때

  // var dynamic_var;
  dynamic dynamic_var;
  dynamic_var = 'Simpson';
  dynamic_var = 1;
  dynamic_var = true;
  //dynamic_var 변수는 어떤 타입이든 할당 가능s

  // null safety
  int? nullable_int;
  nullable_int = 1;
  nullable_int = null;
  // ?[null safety] 변수는 null을 할당 가능

  int price = 1000;

  print("Total price ${price}");
  print("Total price $price");

  // var name = 'nico';
  print("Hi! My name is ${name.toUpperCase()} !");

  void calculateTotal(List<int> items) {
    print(items);
  }

  calculateTotal([1, 2, 3]);

  void calculateTotal2({required List<int> items}) {
    print(items);
  }

  calculateTotal2(items: [1, 2, 3]);

  var a = 1;
  a ??= 0;
  print(a);

}
