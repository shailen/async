import 'dart:async';
import 'dart:math';

// return or throw
int foo() {
  var random = new Random();
  if (!random.nextBool()) {
    throw "not going to give you an int";
  }
  return 4;
}

Future<int> getNum() {
  Completer completer = new Completer();
  int val;
  try {
    val = foo();
    completer.complete(val);
  } catch (e) {
    completer.completeError(e);
  }
  return completer.future;
}

void main() {
  // equivalent of a synchronous `finally`
  getNum().then((value) {
     print(value);
   }).catchError((e) {
     print(e.error);
   }).whenComplete(() {
     print("whenComplete() runs regardless of success or failure");
   });
}