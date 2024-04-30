class PatientAppointmentModel {
  String? sId;
  String? docId;
  String? userId;
  String? gender;
  String? patientAge;
  String? expiryYear;
  String? expiryMonth;
  String? cvv;
  String? cardNumber;
  String? cardType;
  String? selectedDate;
  String? selectedTimeSlot;
  String? bookingDate;
  int? iV;

  PatientAppointmentModel(
      {this.sId,
        this.docId,
        this.userId,
        this.gender,
        this.patientAge,
        this.expiryYear,
        this.expiryMonth,
        this.cvv,
        this.cardNumber,
        this.cardType,
        this.selectedDate,
        this.selectedTimeSlot,
        this.bookingDate,
        this.iV});

  PatientAppointmentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    docId = json['doc_id'];
    userId = json['userId'];
    gender = json['gender'];
    patientAge = json['patientAge'];
    expiryYear = json['expiryYear'];
    expiryMonth = json['expiryMonth'];
    cvv = json['cvv'];
    cardNumber = json['cardNumber'];
    cardType = json['cardType'];
    selectedDate = json['selectedDate'];
    selectedTimeSlot = json['selectedTimeSlot'];
    bookingDate = json['bookingDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['doc_id'] = this.docId;
    data['userId'] = this.userId;
    data['gender'] = this.gender;
    data['patientAge'] = this.patientAge;
    data['expiryYear'] = this.expiryYear;
    data['expiryMonth'] = this.expiryMonth;
    data['cvv'] = this.cvv;
    data['cardNumber'] = this.cardNumber;
    data['cardType'] = this.cardType;
    data['selectedDate'] = this.selectedDate;
    data['selectedTimeSlot'] = this.selectedTimeSlot;
    data['bookingDate'] = this.bookingDate;
    data['__v'] = this.iV;
    return data;
  }
}
