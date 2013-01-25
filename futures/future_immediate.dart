import 'dart:async';

Future<int> getNum() {
  return new Future.immediate(4);
}

// useful if you want to throw based on argument checking, for example
Future<int> useImmediateError() {
  return new Future.immediateError(new ArgumentError());
}

Future<int> useCompleteError() {
  Completer completer = new Completer();
  completer.completeError(new ArgumentError());
  return completer.future;
}

void main() {
  
  // don't use .value. That was tricky if you accessed too soon
  getNum().then((value) {
    print(value);
  });
  
  useImmediateError().then((value) {
    print(value);
  }).catchError((e) {
    print(e.error);
  });
  
  useCompleteError().then((value) {
    print(value);
  }).catchError((e) {
    print(e.error);
  });
}

