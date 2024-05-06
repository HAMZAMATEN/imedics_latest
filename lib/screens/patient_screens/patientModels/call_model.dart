class CallModel {
  String? appointmentId;
  String? doctorId;
  String? userId;
  CallModel(
      {
        required this.appointmentId,
        required  this.doctorId,
        required  this.userId,
        });

  CallModel.fromJson(Map<String, dynamic> json) {

    appointmentId = json['appointment_id'];
    doctorId = json['doctor_id'];
    userId = json['user_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['appointment_id'] = this.appointmentId;
    data['doctor_id'] = this.doctorId;
    data['user_id'] = this.userId;

    return data;
  }
}