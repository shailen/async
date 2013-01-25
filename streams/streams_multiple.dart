import 'dart:async';

Stream stream;

void foo() {
  stream.listen((i) {
    print("in foo(), i = $i");
    if (i == 1) {
      bar();
    }
    if (i == 4) {
      bat();
    }
  });
}

void bar() {
  stream.listen((i) {
    print("in bar(), i = $i");
  });
}

void bat() {
  stream.listen((i) {
    print("in bat(), i = $i");
  });
}

void main() {  
  stream = new Stream.fromIterable([1, 2, 3])
    .asMultiSubscriberStream() // this is the important method here
    .mappedBy((item) => item * item);
  
  //foo();
  bar();
  bat();
}
