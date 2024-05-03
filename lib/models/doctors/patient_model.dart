class PatientModel {
  String? sId;
  String? username;
  String? email;
  String? password;
  bool? status;
  int? iV;

  PatientModel(
      {this.sId,
        this.username,
        this.email,
        this.password,
        this.status,
        this.iV});

  PatientModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    status = json['status'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['status'] = this.status;
    data['__v'] = this.iV;
    return data;
  }
}
