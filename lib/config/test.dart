//
// late String description;
//
// // private은  _로 표시, 접근 범위는 동일 패키지
// String _privateDesc = "this is private val";
//
// void main() {
//
//   description = "desc";
//   String? hello;
//
//   print(description);
//
//   print(_privateDesc);
//
//   print(hello ?? "null이다.");
//
//   //?.
//
//
//   var record = ('first', a: 2, b: true, 'last');
//
//   // collection
//
//   var gifts = {
//     // Key:    Value
//     'first': 'partridge',
//     'second': 'turtledoves',
//     'fifth': 'golden rings'
//   };
//
//
//   Map<String, String?> gifts2 = {
//     // Key:    Value
//     'first': 'partridge',
//     'second': 'turtledoves',
//     'fifth': null
//   };
//
//   Set<String> halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine', 'fluorine'};
//
//   print(halogens);
//   print(gifts);
//   print(gifts['first'] );
//
//
//   testFirst(firstPrint);
//   testFirst(() {
//     print('Anonymous function executed');
//   });
//
//
//   printPlus(x: 3, y: 4);
//
//   printPlus2(x: 2);
//
//   var p1 = Point(3, 2);
//
//   print(p1.i);
//
//   var point = Point.createInstance();
//   print(point.i);
//
//   var vector = Vector2d(x:3);
//   print(vector);
//
//
//   Vector2d? vector2;
//   vector2?.printX();
//
//   var smartTelevision = SmartTelevision();
//
//   smartTelevision.turnOn();
//
//   var musician = Musician();
//
//   musician.entertainMe();
//   musician.entertainMe();
//
//   var tt  = "ssdfsd".toAddHello();
//   print(tt);
//
// }
//
// extension StringParsing on String {
//
//   String toMyUpperCase() {
//     return this.toUpperCase();
//   }
//
//   String toAddHello() {
//     return "${this} hello";
//   }
// }
//
//
//
//
// enum TestEnum {
//   car(tires: 4, passengers: 5),
//   bus(tires: 6, passengers: 50),
//   bicycle(tires: 2, passengers: 1);
//
//   const TestEnum({
//     required this.tires,
//     required this.passengers,
//   });
//
//   final int tires;
//   final int passengers;
//
//
//   static TestEnum findTestEnum(String value){
//     return TestEnum.values.where((element) => element.name == value).first;
//   }
//
// }
//
//
//
// class Musician extends Performer with Musical {
//   // ···
//
//
// }
//
// // abstract interface class Performer {
// //
// //   bool isAbstract = true;
// //
// //   void entertainMe() {
// //     print(isAbstract);
// //   }
// // }
//
// abstract class Performer {
//
//   bool isAbstract = true;
//
//   void entertainMe() {
//     print('????');
//   }
// }
//
// mixin Musical {
//   bool canPlayPiano = false;
//   bool canCompose = false;
//   bool canConduct = false;
//
//   void entertainMe() {
//     if (canPlayPiano) {
//       print('Playing piano');
//     } else if (canConduct) {
//       print('Waving hands');
//     } else {
//       print('Humming to self');
//     }
//   }
// }
//
//
// class Television {
//   void turnOn() {
//     print('tv를 키다');
//   }
// }
//
// class SmartTelevision extends Television {
//
//   @override
//   void turnOn() {
//     print('smart television');
//     super.turnOn();
//   }
//
//
//
// // ···
// }
//
//
//
//
//
//
//
//
//
//
//
//
// class Point {
//
//   final int i;
//   final int j;
//
//   Point(this.i, this.j);
//
//   factory Point.createInstance() {
//     return Point(2, 2);
//   }
// }
//
// class Vector2d {
//   final double x;
//   final double y;
//
//   Vector2d({required this.x, this.y = 4});
//
//   void printX(){
//     print(' check ${this.x}');
//   }
//
//
//   @override
//   String toString() {
//     return 'Vector2d{x: $x, y: $y}';
//   }
// }
//
//
//
// void testFirst(Function() f) {
//   print('test');
//   f.call();
// }
//
// void firstPrint() {
//   print('func is first class');
// }
//
//
// void printPlus2({int? x, int y = 3}){
//   print((x ?? 0 ) *  y);
// }
//
// void printPlus({required int x, required int y}){
//   print(x * y);
// }
//
//
// Iterable<int> naturalsTo(int n) sync* {
//   int k = 0;
//   while (k < n) yield k++;
// }
//
// Stream<int> asynchronousNaturalsTo(int n) async* {
//   int k = 0;
//   while (k < n) yield k++;
// }