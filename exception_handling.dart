import 'dart:io';

void main() {
  double num1;
  double doubleNum;
  String num = '100';
  try {
    doubleNum = double.parse(num);
  } catch (e) {
    print(e);
    doubleNum = 10;
  }
  double sum = doubleNum + 5;
  try {
    checkSum(sum);
    print('Sum is = $sum');
  } catch (e) {
    print(e);
  }
  checkNull(num1);
}

void checkSum(double num) {
  if (num > 100) {
    throw 'Sum should not be greater than 100';
  }
}

void checkNull(double num) {
  // ignore: unnecessary_statements
  // null aware operator
  num ?? 5.0;
  print(num);
}
