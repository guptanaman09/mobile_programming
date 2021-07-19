import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mobile_programming/constants/dimensions.dart';
import 'package:mobile_programming/models/to_do_model.dart';
import 'package:mobile_programming/screens/list_screen.dart';
import 'package:mobile_programming/widgets/edit_text_view.dart';
import 'package:mobile_programming/widgets/text_view.dart';
import 'package:mobile_programming/widgets/vertical_gap.dart';
import 'package:mobx/mobx.dart';

///Created by Naman Gupta on 19/7/21.

part 'list_view_store.g.dart';

class ListViewStore = _ListViewStore with _$ListViewStore;

abstract class _ListViewStore with Store {
  @observable
  ObservableList<ToDoModel> toDoModel = ObservableList<ToDoModel>();

  late Box<ToDoModel> box;
  late ScrollController scrollController;
  late TextEditingController toDoTextController;
  late BuildContext _buildContext;

  late ListScreenState _listScreen;

  _ListViewStore(BuildContext context, ListScreenState listScreen) {
    this._buildContext = context;
    this._listScreen = listScreen;
    toDoTextController = TextEditingController();
    scrollController = ScrollController();
    scrollController.addListener(() {
      print("on Scroll changed-1 >>> ${scrollController.offset}");
      scrollListener();
    });
    getToDoList();
  }

  @action
  void scrollListener() {
    print("on Scroll changed >>> ${scrollController.offset}");
  }

  @action
  getToDoList() async {
    _listScreen.setIsLoading(true);
    box = await Hive.openBox<ToDoModel>('todo');
    toDoModel = ObservableList.of(box.values.toList());
    _listScreen.setIsLoading(false);
    print("toDoModel length get from box >>> ${toDoModel.length}");
  }

  @computed
  int get getToDoLength {
    return toDoModel.length;
  }

  @action
  void addItem() {
    toDoTextController.text = "";
    showDialog(
        context: _buildContext,
        builder: (_) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.size_8),
              ),
              child: Padding(
                padding: EdgeInsets.all(Dimensions.size_16),
                child: Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextView("Enter your to do here"),
                      VerticalGap(Dimensions.size_16),
                      EditTextView("Enter To do", toDoTextController),
                      VerticalGap(Dimensions.size_16),
                      Center(
                        child: ElevatedButton(
                          child: TextView(
                            "Add To-Do",
                            textColor: Colors.white,
                          ),
                          onPressed: () {
                            if (toDoTextController.text.isNotEmpty) {
                              ToDoModel model =
                                  ToDoModel(toDoTextController.text);
                              toDoModel.insert(0, model);
                              box
                                  .clear()
                                  .whenComplete(() => box.addAll(toDoModel));
                              Navigator.pop(_buildContext);
                            } else
                              _listScreen.showInfoBar("Please enter a to do");
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  @action
  void onVerticalGestureDetect(DragEndDetails dragDownValue) {
    print("on drag Down >>> ${dragDownValue.primaryVelocity}");
    if (dragDownValue.primaryVelocity! >= 1500) {
      addItem();
    } else if (dragDownValue.primaryVelocity! <= -1500) {
      removeAll();
    }
  }

  @action
  onDismissView(DismissDirection direction, int index) {
    print("direction >>> ${direction}");
    if (direction == DismissDirection.endToStart) {
      onItemRemoved(index);
    } else if (direction == DismissDirection.startToEnd) {
      onItemDone(index);
    }
  }

  @action
  Future<void> onReorder(int oldIndex, int newIndex) async {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final items = toDoModel.removeAt(oldIndex);
    toDoModel.insert(newIndex, items);
    toDoModel.forEach((element) {
      print("values are >>>${element.text}");
    });
    box.clear().whenComplete(() => box.addAll(toDoModel));
  }

  @action
  void onHorizontalDrag(DragUpdateDetails dragUpdate) {
    print('on horizontal drag >>> ${dragUpdate.globalPosition.dx}');
  }

  @action
  void onItemRemoved(int index) {
    removeFromDatabase(index);
  }

  @action
  void onItemDone(int index) {
    if (!toDoModel[index].isCompleted) {
      _listScreen.showInfoBar("Item Done successfully !!");
      toDoModel[index].isCompleted = true;
      ToDoModel model = toDoModel[index];
      toDoModel.removeAt(index);
      toDoModel.insert(toDoModel.length, model);
      box.clear().whenComplete(() => box.addAll(toDoModel));
    }
  }

  @action
  void removeFromDatabase(int index) {
    _listScreen.showInfoBar("Item removed successfully !!");
    toDoModel.removeAt(index);
    box.keys.forEach((element) {
      print("keys are >> ${element}");
    });
    box.deleteAt(index);
    box.values.forEach((element) {
      print("length >> ${element}");
    });
  }

  @action
  void removeAll() {
    toDoModel.clear();
    box.clear();
  }
}
