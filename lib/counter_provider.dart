
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{

int _count=0;

void increment(){
  _count++;
  notifyListeners();

}

void decrement(){
  if(_count>0){
    _count--;
    notifyListeners();
  }

}

int getcount(){
  return _count;
}


}