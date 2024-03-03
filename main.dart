import 'dart:html';

void main() {
  final InputElement? taskInput = querySelector('#taskInput') as InputElement?;
  final UListElement? taskList = querySelector('#taskList') as UListElement?;

  querySelector('button')!.onClick.listen((event) {
    addTask(taskInput, taskList);
  });

  taskInput?.onKeyPress.listen((event) {
    if (event.keyCode == 13) {
      addTask(taskInput, taskList);
    }
  });
}

void addTask(InputElement? taskInput, UListElement? taskList) {
  if (taskInput?.value?.trim().isNotEmpty ?? false) {
    final LIElement taskItem = LIElement()
      ..text = taskInput!.value;

    taskItem.onClick.listen((event) {
      taskItem.remove();
    });

    taskList!.children.add(taskItem);
    taskInput.value = '';
  }
}
