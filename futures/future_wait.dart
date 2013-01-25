import 'dart:async';
import 'dart:io';

Future<String> wait(num ms) {  
 Completer completer = new Completer();
  
  // simulate expensive activity 
  new Timer(ms, (_) {
    completer.complete("waited $ms ms");
  });
  return completer.future;
}

void main() {
  Future.wait([wait(2000), wait(3000), wait(1000)]).then((value) {
    print(value);
  });
}

