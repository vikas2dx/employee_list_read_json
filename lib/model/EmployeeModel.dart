class EmployeeModel
{
  String firstName,imageUrl;

  EmployeeModel(this.firstName, this.imageUrl);
  EmployeeModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    imageUrl = json['imageUrl'];
  }
}