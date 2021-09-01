import 'dart:io';

void main() {
  performTasks();
}

Future<void> performTasks() async {
  task1();
  task2();
  task3();
  String result4 = await task4();
  task5(result4);
  task1();
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

void task2() {
  String result = 'task 2 data';
  Duration duration = Duration(seconds: 1);
  sleep(duration);
  print('Task 2 complete');
}

void task3() {
  String result = 'task 3 data';
  Duration duration = Duration(seconds: 2);
  Future.delayed(duration, () {
    print('Task 3 complete');
  });
}

Future<String> task4() async {
  String result = 'task 4 data';
  Duration duration = Duration(seconds: 2);
  await Future.delayed(duration, () {
    print('Task 4 complete');
  });
  return result;
}

void task5(result4) {
  String result = 'task 5 data';
  print('Task 5 complete $result4');
}
