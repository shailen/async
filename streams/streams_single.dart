import 'dart:async';

void main() {  
  var mapStream = new Stream.fromIterable([1, 2, 3]).mappedBy((item) => item * item);
  print(mapStream.isSingleSubscription); // true, this is the default
  
  // Note: nothing happens unless there is a listener
  
  // good, now we have a listener
  mapStream.listen((i) {
    print(i);
  });
  
  // bad, now we have a second listener
//  mapStream.listen((i) {
//    print(i);
//  });
}


