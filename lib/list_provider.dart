import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier{
  List<Map<String,dynamic>> _listData=[];

  addListData(Map<String,dynamic> dataToBeAdded){
    _listData.add(dataToBeAdded);
    notifyListeners();
  }

  updateListData(Map<String,dynamic> dataToBeUpdated, int index){
    _listData[index]=dataToBeUpdated;
    notifyListeners();
  }

  deleteListData(index){
    _listData.removeAt(index);
    notifyListeners();
  }

  List<Map<String,dynamic>> getListData(){
    return _listData;
  }


 /* removeDataMap(Map<String,dynamic> dataToBeDeleted){
    _listData.removeWhere((element)=>element==dataToBeDeleted);
    notifyListeners();
  }*/
}