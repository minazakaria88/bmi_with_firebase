class UserModel
{
  late final String  name;
  late final String  email;
  late final String  phone;
  late final String  uId;

  UserModel(
      this.uId,
      this.email,
      this.name,
      this.phone,
      );

  //store data on cloud fire store we use map key:value
  Map<String,dynamic> toMap()
  {
    return {
      'name':name,
      'phone':phone,
      'uId':uId,
      'email':email,
    };
  }


  //get data
  UserModel.fill(Map<String,dynamic> json)
  {
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    uId=json['uId'];
  }
}