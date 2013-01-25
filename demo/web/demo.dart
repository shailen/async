import 'dart:html';

var el = query("#sample_text_id");

void main() {
  el.text = "Click me!";
  var subscr; // StreamSubscription object
  subscr = el.onClick.listen((_) {
   reverseText(); 
   pause_and_resume(subscr);
  });
}

void pause(subscr) {
  subscr.pause();
  _toggle(el, 'resumed', 'paused');
}

void resume(subscr) {
  subscr.resume();
  _toggle(el, 'paused', 'resumed');
}

void pause_and_resume(subscr) {
  pause(subscr);
  window.console.log(subscr);
  window.setTimeout(() {
    resume(subscr);
    window.console.log(subscr);
  }, 2000);
}

void _toggle(el, class1, class2) {
  el.classes.remove(class1);
  el.classes.add(class2);
}

void reverseText() {
  var text = query("#sample_text_id").text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.add(text[i]);
  }
  query("#sample_text_id").text = buffer.toString();
}