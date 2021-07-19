// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_view_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListViewStore on _ListViewStore, Store {
  Computed<int>? _$getToDoLengthComputed;

  @override
  int get getToDoLength =>
      (_$getToDoLengthComputed ??= Computed<int>(() => super.getToDoLength,
              name: '_ListViewStore.getToDoLength'))
          .value;

  final _$toDoModelAtom = Atom(name: '_ListViewStore.toDoModel');

  @override
  ObservableList<ToDoModel> get toDoModel {
    _$toDoModelAtom.reportRead();
    return super.toDoModel;
  }

  @override
  set toDoModel(ObservableList<ToDoModel> value) {
    _$toDoModelAtom.reportWrite(value, super.toDoModel, () {
      super.toDoModel = value;
    });
  }

  final _$getToDoListAsyncAction = AsyncAction('_ListViewStore.getToDoList');

  @override
  Future getToDoList() {
    return _$getToDoListAsyncAction.run(() => super.getToDoList());
  }

  final _$onReorderAsyncAction = AsyncAction('_ListViewStore.onReorder');

  @override
  Future<void> onReorder(int oldIndex, int newIndex) {
    return _$onReorderAsyncAction
        .run(() => super.onReorder(oldIndex, newIndex));
  }

  final _$_ListViewStoreActionController =
      ActionController(name: '_ListViewStore');

  @override
  void scrollListener() {
    final _$actionInfo = _$_ListViewStoreActionController.startAction(
        name: '_ListViewStore.scrollListener');
    try {
      return super.scrollListener();
    } finally {
      _$_ListViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItem() {
    final _$actionInfo = _$_ListViewStoreActionController.startAction(
        name: '_ListViewStore.addItem');
    try {
      return super.addItem();
    } finally {
      _$_ListViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onVerticalGestureDetect(DragEndDetails dragDownValue) {
    final _$actionInfo = _$_ListViewStoreActionController.startAction(
        name: '_ListViewStore.onVerticalGestureDetect');
    try {
      return super.onVerticalGestureDetect(dragDownValue);
    } finally {
      _$_ListViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDismissView(DismissDirection direction, int index) {
    final _$actionInfo = _$_ListViewStoreActionController.startAction(
        name: '_ListViewStore.onDismissView');
    try {
      return super.onDismissView(direction, index);
    } finally {
      _$_ListViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onHorizontalDrag(DragUpdateDetails dragUpdate) {
    final _$actionInfo = _$_ListViewStoreActionController.startAction(
        name: '_ListViewStore.onHorizontalDrag');
    try {
      return super.onHorizontalDrag(dragUpdate);
    } finally {
      _$_ListViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onItemRemoved(int index) {
    final _$actionInfo = _$_ListViewStoreActionController.startAction(
        name: '_ListViewStore.onItemRemoved');
    try {
      return super.onItemRemoved(index);
    } finally {
      _$_ListViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onItemDone(int index) {
    final _$actionInfo = _$_ListViewStoreActionController.startAction(
        name: '_ListViewStore.onItemDone');
    try {
      return super.onItemDone(index);
    } finally {
      _$_ListViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromDatabase(int index) {
    final _$actionInfo = _$_ListViewStoreActionController.startAction(
        name: '_ListViewStore.removeFromDatabase');
    try {
      return super.removeFromDatabase(index);
    } finally {
      _$_ListViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAll() {
    final _$actionInfo = _$_ListViewStoreActionController.startAction(
        name: '_ListViewStore.removeAll');
    try {
      return super.removeAll();
    } finally {
      _$_ListViewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
toDoModel: ${toDoModel},
getToDoLength: ${getToDoLength}
    ''';
  }
}
