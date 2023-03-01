import 'package:flutter/material.dart';
import '../model/home/home_model.dart';
import 'package:get_storage/get_storage.dart';

class Home with ChangeNotifier {

  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  List<Item> inputs = [];
  int? _selectedIndex;
  bool updateSelection = false;

  void onAddPressed() {
    updateSelection = false;
    inputs.add(
        Item(name: textController1.text, description: textController2.text));
    textController1.clear();
    textController2.clear();
    notifyListeners();

  }


  // void onUpdate(int index ){
  //   updateSelection = true;
  //   List<Item> values = [
  //     Item(
  //         name: inputs[_selectedIndex!].name,
  //         description: inputs[_selectedIndex!].description)
  //   ];
  //   values[index].name = textController1.text ;
  //   values[index].description= textController2.text ;
  //
  //
  //   notifyListeners();
  // }



  void onDeletePressed(int index) {
    inputs.removeAt(index);
    notifyListeners();
  }

  void onEditPressed(int index) {
    _selectedIndex = index;
    updateSelection = true;
    List<Item> values = [
      Item(
          name: inputs[_selectedIndex!].name,
          description: inputs[_selectedIndex!].description)
    ];
    textController1.text = values[0].name;
    textController2.text = values[0].description;
    notifyListeners();
  }
}
