
class UserBookAppointmentModel {
  String bookingType;
  String gender;
  String patientAge;
  String expiryYear;
  String expiryMonth;
  String cvv;
  String cardNumber;
  String cardName;
  String cardType;
  String selectedDate;
  String selectedTimeSlot;
  String docId;
  String bookingDate;
  String userId;
  String Details;

  UserBookAppointmentModel({
    required this.bookingType,
    required this.gender,
    required this.patientAge,
    required this.Details,
    required this.expiryYear,
    required this.expiryMonth,
    required this.cvv,
    required this.cardNumber,
    required this.cardName,
    required this.cardType,
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.docId,
    required this.bookingDate,
    required this.userId,
  });

  factory UserBookAppointmentModel.fromJson(Map<String, dynamic> json) {
    return UserBookAppointmentModel(
      bookingType: json['bookingType'],
      gender: json['gender'],
      Details: json['Details'],
      patientAge: json['patientAge'],
      expiryYear: json['expiryYear'],
      expiryMonth: json['expiryMonth'],
      cvv: json['cvv'],
      cardNumber: json['cardNumber'],
      cardName: json['cardName'],
      cardType: json['cardType'],
      selectedDate: json['selectedDate'],
      selectedTimeSlot: json['selectedTimeSlot'],
      docId: json['doc_id'],
      bookingDate: json['bookingDate'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookingType': bookingType,
      'Details': Details,
      'gender': gender,
      'patientAge': patientAge,
      'expiryYear': expiryYear,
      'expiryMonth': expiryMonth,
      'cvv': cvv,
      'cardNumber': cardNumber,
      'cardName': cardName,
      'cardType': cardType,
      'selectedDate': selectedDate,
      'selectedTimeSlot': selectedTimeSlot,
      'doc_id': docId,
      'bookingDate': bookingDate,
      'userId': userId,
    };
  }
}
