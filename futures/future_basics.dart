import 'dart:async';

Future<int> getNum() {
  Completer completer = new Completer();
  completer.complete(4);
  return completer.future;
}

void main() {
  getNum().then((value) {
    print(value);
  });
}

