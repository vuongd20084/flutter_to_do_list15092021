import 'dart:async';
void main() {
  print('Hello, World!');
  handle(5,5);
}

void handle(int a , int b) async{
  try{
    var ketQua1 = await tong(a , b);
    var ketQua2 = await tru(ketQua1 , 5);
    print(ketQua2);
  }catch(e){
    print(e);
  }
}


Future tong(int a , int b){
  Completer completer = Completer();
  Future.delayed(Duration(seconds: 1),(){
    completer.complete(a + b);
  });
  return completer.future;
}

Future tru(int a , int b){
  Completer completer = Completer();
  Future.delayed(Duration(seconds: 1),(){
    completer.complete(a - b);
  });
  return completer.future;
}