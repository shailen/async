import 'dart:io';
import 'dart:async';

int foo() {
  throw "not going to give you an int";
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
  //var num = getNum();
  // trouble.....
  // if you're going to have a Timer, call getNum() afterwards.
  new Timer(2000, (_) {
    getNum().then((value) {  
      print("the number $value was returned");
    }).catchError((e) {
      print(e.error);
    });
  });
}
