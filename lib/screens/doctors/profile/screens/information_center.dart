import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imedics_latest/components/app_text_widgets.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/utils/app_text.dart';
import 'package:imedics_latest/utils/myFonts.dart';

class InformationCenter extends StatelessWidget {
  const InformationCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 251, 250, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(246, 251, 250, 1),
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20.h,
            color: AppColors.black94,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Information Center',
          style: getSemiBoldStyle(
              color: AppColors.black94, fontSize: MyFonts.size18),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildFeatureExpansionTile(
              context: context,
              title: 'Appointments Management',
              dialogTitle: 'Appointments Management',

              dialogSubtitle: "Appointment Management allows doctors to efficiently handle their schedules by providing a centralized platform to view, schedule, and manage appointments with patients.",
              subtitle: 'View and manage upcoming appointments with patients.',
              icon: Icons.calendar_today,
              onTap: () {
                // Navigate to appointments screen

              },
            ),
            buildFeatureExpansionTile(
              context: context,
              title: 'Shared Reports Viewing',
              dialogSubtitle: "Shared Reports Viewing allows doctors to access and view medical reports that are shared by patients. This feature is crucial for effective healthcare management as it enables doctors to review diagnostic reports, test results, medical images, and other relevant documents provided by patients.",
              dialogTitle: 'Shared Reports Viewing',
              subtitle: 'Access and view medical reports shared by patients.',
              icon: Icons.description,
              onTap: () {
                // Navigate to shared reports screen
              },
            ),
            buildFeatureExpansionTile(
              context: context,
              title: 'Video Call Capability',
              dialogSubtitle: "The Video Call Capability feature allows doctors to initiate video calls with their patients for remote consultations. This feature enables doctors to conduct face-to-face consultations with patients without the need for them to visit the clinic physically. It enhances accessibility to healthcare services, especially for patients who are unable to travel due to various reasons such as distance, illness, or mobility issues.",
              dialogTitle: 'Video Call Capability',
              subtitle:
                  'Initiate video calls with patients for remote consultations.',
              icon: Icons.videocam,
              onTap: () {
                // Start video call functionality
              },
            ),
            buildFeatureExpansionTile(
              context: context,
              title: 'Chatting Feature',
              dialogTitle: 'Chatting Feature',
              dialogSubtitle: "The 'Chatting Feature' in iMediFix Doctor app allows doctors to communicate with patients via chat for quick queries and updates.",
              subtitle:
                  'Communicate with patients via chat for quick queries and updates.',
              icon: Icons.chat,
              onTap: () {
                // Start chat functionality
              },
            ),
            buildFeatureExpansionTile(
              context: context,
              title: 'Office/Hospital Joining',
              dialogSubtitle: "This feature enables doctors to search and join additional medical facilities such as hospitals, clinics, or medical practices. By utilizing this functionality, doctors can expand their practice network and provide medical services across multiple locations. Joining additional medical facilities allows doctors to reach a wider patient base and enhance their availability for consultations and treatments. This feature facilitates seamless integration into new healthcare settings, fostering collaboration among medical professionals and improving patient care delivery.",
              dialogTitle: 'Office/Hospital Joining',
              subtitle:
                  'Search and join additional medical facilities for better patient care.',
              icon: Icons.location_city,
              onTap: () {
                // Navigate to office/hospital search screen
              },
            ),
            buildFeatureExpansionTile(
              context: context,
              title: 'Contact Information',
              dialogSubtitle: "Get assistance by our 24/7 support system.Get in touch through\nWhatsapp:+1-555-5555-5555\nEmail:imdefixsupport@medfix.org",
              dialogTitle: 'Get in touch',
              subtitle:
              "Get assistance by our 24/7 support system.Get in touch through\nWhatsapp:+1-555-5555-5555\nEmail:imdefixsupport@medfix.org",
              icon: Icons.help,
              onTap: () {
                // Navigate to office/hospital search screen
              },
            ),

          ],
        ),
      ),
    );
  }

  Widget buildFeatureExpansionTile({
    required String title,
    required String subtitle,
    required String dialogTitle,
    required String dialogSubtitle,
    required IconData icon,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: EdgeInsets.all(16.0),
          leading: Icon(
            icon,
            size: 36.0,
            color: AppColors.appColor,
          ),
          title: Text(
            title,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[700],
            ),
          ),
          childrenPadding: EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            Divider(
              color: Colors.transparent,
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            '$dialogTitle',
                            style: getSemiBoldStyle(
                                color: AppColors.appColor, fontSize: 20.sp),
                          ),
                          content: Text(
                              "$dialogSubtitle"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Close',
                                style: getRegularStyle(color: AppColors.appColor),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'View Details',
                    style: TextStyle(
                      color: AppColors.appColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
