import 'dart:async';
import 'dart:io';

void main() {
  var a = new List();
  a.addAll([1, 2, 3]);
  
  var mappedList = a.mappedBy((item) => item * item * item);
  mappedList.forEach((i) {
    print(i);
  });
  
  print('--');
  
  a.add(4);
  a[0] = 100;
  
  // no need to call mappedBy() on `a` again 
  mappedList.forEach((i) {
    print(i);
  });
  
  // mappedBy is lazy. call toList()
  print(a.toList());
  
  // here is a streamed version
  print("mappedBy in a streamed context:");
  var s = new Stream.fromIterable(a);
  s.mappedBy((item) => item * item).listen((item) {
    print(item);
  });
}

