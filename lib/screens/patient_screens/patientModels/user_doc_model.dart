class UserDocModel {
  String? sId;
  String? image;
  String? name;
  String? email;
  String? password;
  String? specialization;
  String? conditionstreated;
  String? aboutself;
  String? education;
  String? college;
  String? license;
  String? yearofexperience;
  var once;
  var daily;
  var weekly;
  int? iV;
  bool? status;

  UserDocModel(
      {this.sId,
        this.image,
        this.name,
        this.email,
        this.password,
        this.specialization,
        this.conditionstreated,
        this.aboutself,
        this.education,
        this.college,
        this.license,
        this.yearofexperience,
        this.once,
        this.daily,
        this.weekly,
        this.iV,
        this.status});

  UserDocModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    specialization = json['specialization'];
    conditionstreated = json['conditionstreated'];
    aboutself = json['aboutself'];
    education = json['education'];
    college = json['college'];
    license = json['license'];
    yearofexperience = json['yearofexperience'];
    once = json['once'];
    // if (json['once'] != null) {
    //   once = <Once>[];
    //   json['once'].forEach((v) {
    //     once!.add(new Once.fromJson(v));
    //   });
    // }
    daily = json['daily'];
    // if (json['daily'] != null) {
    //   daily = <Daily>[];
    //   json['daily'].forEach((v) {
    //     daily!.add(new Daily.fromJson(v));
    //   });
    // }
    weekly = json['weekly'];
    // if (json['weekly'] != null) {
    //   weekly = <Weekly>[];
    //   json['weekly'].forEach((v) {
    //     weekly!.add(new Weekly.fromJson(v));
    //   });
    // }
    iV = json['__v'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['specialization'] = this.specialization;
    data['conditionstreated'] = this.conditionstreated;
    data['aboutself'] = this.aboutself;
    data['education'] = this.education;
    data['college'] = this.college;
    data['license'] = this.license;
    data['yearofexperience'] = this.yearofexperience;
    // if (this.once != null) {
    //   data['once'] = this.once!.map((v) => v.toJson()).toList();
    // }
    data['once']=this.once;
    // if (this.daily != null) {
    //   data['daily'] = this.daily!.map((v) => v.toJson()).toList();
    // }
    data['daily'] = this.weekly;
    // if (this.weekly != null) {
    //   data['weekly'] = this.weekly!.map((v) => v.toJson()).toList();
    // }
    data['weekly'] = this.weekly;
    data['__v'] = this.iV;
    data['status'] = this.status;
    return data;
  }
}

class Once {
  String? date;
  String? timefrom;
  String? timetill;
  String? consultationfees;
  String? sId;

  Once(
      {this.date,
        this.timefrom,
        this.timetill,
        this.consultationfees,
        this.sId});

  Once.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    timefrom = json['timefrom'];
    timetill = json['timetill'];
    consultationfees = json['consultationfees'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['timefrom'] = this.timefrom;
    data['timetill'] = this.timetill;
    data['consultationfees'] = this.consultationfees;
    data['_id'] = this.sId;
    return data;
  }
}

class Daily {
  String? datefrom;
  String? datetill;
  String? timefrom;
  String? timetill;
  String? consultationfees;
  String? sId;

  Daily(
      {this.datefrom,
        this.datetill,
        this.timefrom,
        this.timetill,
        this.consultationfees,
        this.sId});

  Daily.fromJson(Map<String, dynamic> json) {
    datefrom = json['datefrom'];
    datetill = json['datetill'];
    timefrom = json['timefrom'];
    timetill = json['timetill'];
    consultationfees = json['consultationfees'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datefrom'] = this.datefrom;
    data['datetill'] = this.datetill;
    data['timefrom'] = this.timefrom;
    data['timetill'] = this.timetill;
    data['consultationfees'] = this.consultationfees;
    data['_id'] = this.sId;
    return data;
  }
}

class Weekly {
  String? day;
  String? timefrom;
  String? timetill;
  String? consultationfees;
  String? sId;

  Weekly(
      {this.day,
        this.timefrom,
        this.timetill,
        this.consultationfees,
        this.sId});

  Weekly.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    timefrom = json['timefrom'];
    timetill = json['timetill'];
    consultationfees = json['consultationfees'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['timefrom'] = this.timefrom;
    data['timetill'] = this.timetill;
    data['consultationfees'] = this.consultationfees;
    data['_id'] = this.sId;
    return data;
  }
}
