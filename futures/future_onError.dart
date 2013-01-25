import 'dart:io';
import 'dart:async';

int foo() {
  return 4;
  //throw "not going to give you an int";
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
  getNum().then((value) {  
    print("the number $value was returned");
    throw "rethrowing";
  },
  // oops, don't know what to do with "rethrowing"
  onError : (AsyncError e) {
    print(e.error);
  });
}




