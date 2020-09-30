import 'dart:io';

void main() {
  performTasks();
}

// wait for task2() to complete then move on to task3()
void performTasks() async {
  task1();
  String data = await task2();
  task3(data);
}

void task1() {
  print('Task 1 complete');
}

Future<String> task2() async {
  String result;
  Duration threeSeconds = Duration(seconds: 3);
  // sleep() is a synchronous function
  // sleep(threeSeconds);
  // This is an asynchronous function
  // Now what if task3() requires some data from task2()
  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String taskTwoData) {
  print('Task 3 complete with $taskTwoData');
}
