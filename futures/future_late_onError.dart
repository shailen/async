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
  var num = getNum();
  
  // trouble...Call getNum() after new Timer(3000)...
  new Timer(3000, (_) {
    num.then((value) {  
      print("the number $value was returned");
    },
    // oops, too late
    onError : (AsyncError e) {
      print(e.error);
    });
  });
}
