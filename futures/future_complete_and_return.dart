import 'dart:io';
import 'dart:async';

Future<int> getNum() {
  Completer completer = new Completer();
  new Timer(2000, (_) {
    completer.complete(4);
  });
    
  print("returning.....");
  return completer.future;
}

void main() {
  getNum().then((value) {
    print(value);
  });  
}