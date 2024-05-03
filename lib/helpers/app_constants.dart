class AppConstants{

  static String baseUrl = 'https://imdfx-newserver-production.up.railway.app/api';
  static String imageBaseUrl = 'https://imdfx-newserver-production.up.railway.app';

  // on boarding account variables
  static int index = 0;

  static int doctorAccountType = 0;

  static int accountType = 0;

  //user details
  static String userId = '';
  static String userName = '';
  static String userEmail = '';
  static double wallAmount = 0.0;
  static String docFee ="";
  static String docId = '';
  static String docName = '';
  static String docEmail = '';
  static double docWallAmount = 0.0;
  // static String docFee ="";

  static void clearUserValues(){
    userId="";
    userName="";
    userEmail="";
    wallAmount = 0.0;
  }
  static void clearIndDoctorValues(){
    docId="";
    docName="";
    docEmail="";
    docWallAmount = 0.0;
  }

  //Firebase Constants
  static String userCollection = "users";
  static String individualDoctorCollection = "doctors";

}