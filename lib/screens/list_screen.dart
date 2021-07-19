import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:mobile_programming/base/base_class.dart';
import 'package:mobile_programming/constants/colors.dart';
import 'package:mobile_programming/constants/dimensions.dart';
import 'package:mobile_programming/models/to_do_model.dart';
import 'package:mobile_programming/stores/splash/list_view_store.dart';
import 'package:mobile_programming/widgets/edit_text_view.dart';
import 'package:mobile_programming/widgets/text_view.dart';
import 'package:mobile_programming/widgets/vertical_gap.dart';
import 'package:provider/provider.dart';

///Created by Naman Gupta on 16/7/21.

class ListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListScreenState();
  }
}

class ListScreenState extends BaseClass with SingleTickerProviderStateMixin {
  late ListViewStore _store;

  @override
  void initState() {
    super.initState();
    _store = ListViewStore(context, this);
    // toDoTextController = TextEditingController();
    // scrollController = ScrollController();
    // scrollController.addListener(() {
    //   print("on Scroll changed-1 >>> ${scrollController.offset}");
    //   scrollListener();
    // });
    // getToDoList();
  }

  // void scrollListener() {
  //   print("on Scroll changed >>> ${scrollController.offset}");
  // }

  // getToDoList() async {
  //   box = await Hive.openBox<ToDoModel>('todo');
  //   setState(() {
  //     toDoModel = box.values.toList();
  //   });
  //   print("toDoModel length get from box >>> ${toDoModel.length}");
  // }

  @override
  Widget? setBody() {
    return Observer(
        builder: (context) => GestureDetector(
              onVerticalDragEnd: (dragDownValue) {
                // print("on drag Down >>> ${dragDownValue.primaryVelocity}");
                // if (dragDownValue.primaryVelocity! >= 1500) {
                //   addItem();
                // } else if (dragDownValue.primaryVelocity! <= -1500) {
                //   removeAll();
                // }
                _store.onVerticalGestureDetect(dragDownValue);
              },
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: _store.getToDoLength == 0
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextView(
                              "No To Do available. Pull Down to add new.",
                              isBool: true,
                              size: Dimensions.size_18,
                            ),
                            // ElevatedButton(
                            //   onPressed: () => addItem(),
                            //   child: TextView(
                            //     "Add Here",
                            //     textColor: Colors.white,
                            //   ),
                            //   style: ButtonStyle(),
                            // )
                          ],
                        ),
                      )
                    : ReorderableListView(
                        scrollController: _store.scrollController,
                        children: _store.toDoModel
                            .asMap()
                            .map((i, item) => MapEntry(i, itemLayout(item, i)))
                            .values
                            .toList(),
                        shrinkWrap: true,
                        onReorder: (oldIndex, newIndex) =>
                            _store.onReorder(oldIndex, newIndex)),
              ),
            ));
  }

  Widget itemLayout(ToDoModel item, int index) {
    return GestureDetector(
      key: UniqueKey(),
      onHorizontalDragUpdate: _store.onHorizontalDrag,
      child: Dismissible(
        secondaryBackground: Container(
          color: Colors.black,
          padding: EdgeInsets.only(right: Dimensions.size_16),
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.cancel,
              color: Colors.red,
              size: 30,
            ),
          ),
        ),
        background: Container(
          color: Colors.black,
          padding: EdgeInsets.only(left: Dimensions.size_16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.check,
              color: Colors.green,
              size: 30,
            ),
          ),
        ),
        key: UniqueKey(),
        child: Stack(alignment: Alignment.center, children: [
          Container(
            padding: EdgeInsets.all(Dimensions.size_16),
            decoration: BoxDecoration(
                color: item.isCompleted
                    ? AppColors.grey_8
                    : Colors.primaries[Random().nextInt(10)]),
            child: Center(
              child: TextView(
                item.text,
                size: Dimensions.size_20,
              ),
            ),
          ),
          item.isCompleted
              ? Container(
                  height: Dimensions.size_1,
                  color: Colors.black,
                )
              : Container()
        ]),
        onDismissed: (direction) {
          // print("direction >>> ${direction}");
          // if (direction == DismissDirection.endToStart) {
          //   onItemRemoved(index);
          // } else if (direction == DismissDirection.startToEnd) {
          //   onItemDone(index);
          // }
          _store.onDismissView(direction, index);
        },
      ),
    );
  }

  // void addItem() {
  //   _store.toDoTextController.text = "";
  //   showDialog(
  //       context: context,
  //       builder: (_) => Dialog(
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(Dimensions.size_8),
  //             ),
  //             child: Padding(
  //               padding: EdgeInsets.all(Dimensions.size_16),
  //               child: Container(
  //                 height: 200,
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   mainAxisSize: MainAxisSize.max,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     TextView("Enter your to do here"),
  //                     VerticalGap(Dimensions.size_16),
  //                     EditTextView("Enter To do", toDoTextController),
  //                     VerticalGap(Dimensions.size_16),
  //                     Center(
  //                       child: ElevatedButton(
  //                         child: TextView("Add To-Do"),
  //                         onPressed: () {
  //                           if (toDoTextController.text.isNotEmpty) {
  //                             setState(() {
  //                               ToDoModel model =
  //                                   ToDoModel(toDoTextController.text);
  //                               toDoModel.add(model);
  //                               box.add(model);
  //                             });
  //                             Navigator.pop(context);
  //                           } else
  //                             showInfoBar("Please enter a to do");
  //                         },
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ));
  // }

  // void onReorder(int oldIndex, int newIndex) {
  //   setState(() {
  //     if (newIndex > oldIndex) {
  //       newIndex -= 1;
  //     }
  //     final items = toDoModel.removeAt(oldIndex);
  //     toDoModel.insert(newIndex, items);
  //   });
  // }
  //
  // void onHorizontalDrag(DragUpdateDetails dragUpdate) {
  //   print('on horizontal drag >>> ${dragUpdate.globalPosition.dx}');
  // }
  //
  // void onItemRemoved(int index) {
  //   removeFromDatabase(index);
  // }
  //
  // void onItemDone(int index) {
  //   showInfoBar("Item Done successfully !!");
  // }
  //
  // void removeFromDatabase(int index) {
  //   showInfoBar("Item removed successfully !!");
  //   setState(() {
  //     toDoModel.removeAt(index);
  //     box.keys.forEach((element) {
  //       print("keys are >> ${element}");
  //     });
  //     box.deleteAt(index);
  //   });
  // }
  //
  // void removeAll() {
  //   setState(() {
  //     toDoModel.clear();
  //     box.clear();
  //   });
  // }
}
