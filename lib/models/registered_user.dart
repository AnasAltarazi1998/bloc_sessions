class RegisteredUser {
  int id;
  String username;
  String email;
  String password;
  Null birthday;
  Null address;
  String college;
  String gender;

  RegisteredUser(
      {this.id,
      this.username,
      this.email,
      this.password,
      this.birthday,
      this.address,
      this.college,
      this.gender});

  RegisteredUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    birthday = json['birthday'];
    address = json['address'];
    college = json['college'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['birthday'] = this.birthday;
    data['address'] = this.address;
    data['college'] = this.college;
    data['gender'] = this.gender;
    return data;
  }
}
