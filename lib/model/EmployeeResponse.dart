import 'package:news_app_gson/model/EmployeeModel.dart';

class EmployeeResponse
{
  final List<EmployeeModel> list;

  EmployeeResponse({
    this.list,
  });

  factory EmployeeResponse.fromJson(List<dynamic> parsedJson) {
    List<EmployeeModel> list = new List<EmployeeModel>();
    list = parsedJson.map((i) => EmployeeModel.fromJson(i)).toList();

    return new EmployeeResponse(list: list);
  }
}