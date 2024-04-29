// ignore_for_file: prefer_const_constructors

// import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:imedics_latest/components/custom_text_field.dart';
import 'package:imedics_latest/components/session_button.dart';
import 'package:imedics_latest/helpers/app_colors.dart';
import 'package:imedics_latest/screens/doctors/session/register/controller.dart';
import 'package:imedics_latest/utils/app_paddings.dart';
import 'package:intl/intl.dart';

class ConsultationTimeView extends StatefulWidget {
  const ConsultationTimeView(
      {super.key, required this.onPressed, required this.onPressedback});

  final VoidCallback onPressed;
  final VoidCallback onPressedback;

  @override
  State<ConsultationTimeView> createState() => _ConsultationTimeViewState();
}

class _ConsultationTimeViewState extends State<ConsultationTimeView>
    with SingleTickerProviderStateMixin {
  final contoller = Get.put(IndividualDoctorRegisterController());
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDateonce(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;

        contoller.state.registerIndividualDoctorOnce_dateCon.text =
            DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

////

  Future<void> _selectFromTimeonce(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final String formattedTime = picked.format(context);

      setState(() {
        contoller.state.registerIndividualDoctorOnce_time_formCon.text =
            formattedTime;
      });
    }
  }

  Future<void> _selectTimeTillonce(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final String formattedTime = picked.format(context);

      setState(() {
        contoller.state.registerIndividualDoctorOnce_time_tillCon.text =
            formattedTime;
      });
    }
  }

  Future<void> _selectDatedailyTill(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;

        contoller.state.registerIndividualDoctorDaily_dateTileCon.text =
            DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  int _selectedDayIndex = 0; // To keep track of the selected day

  // Helper function to get the first date of the month
  DateTime _findFirstDateOfTheMonth(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, 1);
  }

  List<DateTime> get _monthDays {
    final firstDayOfTheMonth = _findFirstDateOfTheMonth(_selectedDate);
    final daysInMonth =
        DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;

    return List.generate(
        daysInMonth, (index) => firstDayOfTheMonth.add(Duration(days: index)));
  }

  Future<void> _selectDatedailyFrom(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;

        contoller.state.registerIndividualDoctorDaily_dateFromCon.text =
            DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

////

  Future<void> _selectFromTimedaily(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      // Format the picked TimeOfDay to a string
      final String formattedTime = picked.format(context);

      // Assign the formatted time to the text controller
      setState(() {
        contoller.state.registerIndividualDoctorDaily_time_formCon.text =
            formattedTime;
      });
    }
  }

  Future<void> _selectTimeTilldaily(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      // Format the picked TimeOfDay to a string
      final String formattedTime = picked.format(context);

      // Assign the formatted time to the text controller
      setState(() {
        contoller.state.registerIndividualDoctorDaily_time_tillCon.text =
            formattedTime;
      });
    }
  }

  Future<void> _selectDateweek(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          _selectedDate, // This now has a default value of DateTime.now().
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // Format the picked date and assign it to the text controller.
        contoller.state.registerIndividualDoctorWeekly_dateCon.text =
            DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

////

  Future<void> _selectFromTimeweek(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      // Format the picked TimeOfDay to a string
      final String formattedTime = picked.format(context);

      // Assign the formatted time to the text controller
      setState(() {
        contoller.state.registerIndividualDoctorWeekly_time_formCon.text =
            formattedTime;
      });
    }
  }

  Future<void> _selectTimeTillweek(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final String formattedTime = picked.format(context);

      setState(() {
        contoller.state.registerIndividualDoctorWeekly_time_tillCon.text =
            formattedTime;
      });
    }
  }

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  //final TextEditingController namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: 1.sw,
        decoration: const BoxDecoration(
          color: AppColors.lightBg,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.lightgrey,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: TabBar(
                    indicatorPadding: EdgeInsets.zero,
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    // give the indicator a decoration (color and border radius)
                    indicator: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        AppColors.appColor1,
                        AppColors.appColor,
                      ]),
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      color: Colors.green,
                    ),
                    labelColor: AppColors.white,
                    unselectedLabelColor: AppColors.grey,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: 170.w,
                          child: const Center(child: Text('once')),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: 170.w,
                          child: const Center(child: Text('Daily')),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: 170.w,
                          child: const Center(child: Text('weekly')),
                        ),
                      ),
                    ],
                  ),
                ),
                padding10,
                _tabController.index == 0
                    ? SizedBox(
                        child: Column(
                          children: [
                            TextField(
                                controller: contoller
                                    .state.registerIndividualDoctorOnce_dateCon,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  hintText: 'Select Date',
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: IconButton(
                                    icon: Image.asset(
                                      'assets/images/calendar.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                    onPressed: () => _selectDateonce(context),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35),
                                    borderSide: BorderSide(
                                      color: Colors.grey, // Border color
                                      width: 1, // Border width
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35),
                                    borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(
                                          0.5), // Border color for enabled state
                                      width: 1, // Border width
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35),
                                    borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(
                                          0.7), // Border color for focused state
                                      width: 1, // Border width
                                    ),
                                  ),
                                ),
                              ),

                            SizedBox(
                              height: 20,
                            ), TextField(
                                controller: contoller.state
                                    .registerIndividualDoctorOnce_time_formCon,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  hintText: ' Time From',
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: IconButton(
                                    icon: Image.asset(
                                      'assets/images/sun.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                    onPressed: () =>
                                        _selectFromTimeonce(context),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35),
                                    borderSide: BorderSide(
                                      color: Colors.grey, // Border color
                                      width: 1, // Border width
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35),
                                    borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(
                                          0.5), // Border color for enabled state
                                      width: 1, // Border width
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35),
                                    borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(
                                          0.7), // Border color for focused state
                                      width: 1, // Border width
                                    ),
                                  ),
                                ),
                              ),

                            SizedBox(
                              height: 20,
                            ),
                           TextField(
                                controller: contoller.state
                                    .registerIndividualDoctorOnce_time_tillCon,
                                decoration: InputDecoration(
                                  hintText: 'Time Till',
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: IconButton(
                                    icon: Image.asset(
                                      'assets/images/moon.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                    onPressed: () =>
                                        _selectTimeTillonce(context),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35),
                                    borderSide: BorderSide(
                                      color: Colors.grey, // Border color
                                      width: 1, // Border width
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35),
                                    borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(
                                          0.5), // Border color for enabled state
                                      width: 1, // Border width
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(35),
                                    borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(
                                          0.7), // Border color for focused state
                                      width: 1, // Border width
                                    ),
                                  ),
                                ),
                              ),

                            SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                              leadingIconPath: 'assets/images/currency.png',
                              validatorFn: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              texfieldHeight: 60.h,
                              controller: contoller.state
                                  .registerIndividualDoctorOnce_consultation_freeCon,
                              hintText: 'Consultation free',
                              onChanged: (value) {},
                              onFieldSubmitted: (value) {},
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              obscure: false,
                              label: '',
                              subTitle: '',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Standard Duration: 30 - 60 Minutes',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    : _tabController.index == 1
                        ? SizedBox(
                            child: Column(
                              children: [

                                  TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    controller: contoller.state
                                        .registerIndividualDoctorDaily_dateFromCon,
                                    decoration: InputDecoration(
                                      hintText: ' Date From',
                                      filled: true,
                                      fillColor: Colors.white,
                                      prefixIcon: IconButton(
                                        icon: Image.asset(
                                          'assets/images/calendar.png',
                                          width: 30,
                                          height: 30,
                                        ),
                                        onPressed: () =>
                                            _selectDatedailyFrom(context),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey, // Border color
                                          width: 1, // Border width
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(
                                              0.5), // Border color for enabled state
                                          width: 1, // Border width
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(
                                              0.7), // Border color for focused state
                                          width: 1, // Border width
                                        ),
                                      ),
                                    ),
                                  ),

                                SizedBox(
                                  height: 20,
                                ),

                                 TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    controller: contoller.state
                                        .registerIndividualDoctorDaily_dateTileCon,
                                    decoration: InputDecoration(
                                      hintText: 'Date Till',
                                      filled: true,
                                      fillColor: Colors.white,
                                      prefixIcon: IconButton(
                                        icon: Image.asset(
                                          'assets/images/calendar.png',
                                          width: 30,
                                          height: 30,
                                        ),
                                        onPressed: () =>
                                            _selectDatedailyTill(context),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey, // Border color
                                          width: 1, // Border width
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(
                                              0.5), // Border color for enabled state
                                          width: 1, // Border width
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(
                                              0.7), // Border color for focused state
                                          width: 1, // Border width
                                        ),
                                      ),
                                    ),
                                  ),

                                SizedBox(
                                  height: 20,
                                ),
                                 TextField(
                                    controller: contoller.state
                                        .registerIndividualDoctorDaily_time_formCon,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    decoration: InputDecoration(
                                      hintText: ' Time From',
                                      filled: true,
                                      fillColor: Colors.white,
                                      prefixIcon: IconButton(
                                        icon: Image.asset(
                                          'assets/images/sun.png',
                                          width: 30,
                                          height: 30,
                                        ),
                                        onPressed: () =>
                                            _selectFromTimedaily(context),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey, // Border color
                                          width: 1, // Border width
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(
                                              0.5), // Border color for enabled state
                                          width: 1, // Border width
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(
                                              0.7), // Border color for focused state
                                          width: 1, // Border width
                                        ),
                                      ),
                                    ),
                                  ),

                                SizedBox(
                                  height: 20,
                                ),
                                 TextField(
                                    controller: contoller.state
                                        .registerIndividualDoctorDaily_time_tillCon,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    decoration: InputDecoration(
                                      hintText: 'Time Till',
                                      filled: true,
                                      fillColor: Colors.white,
                                      prefixIcon: IconButton(
                                        icon: Image.asset(
                                          'assets/images/moon.png',
                                          width: 30,
                                          height: 30,
                                        ),
                                        onPressed: () =>
                                            _selectTimeTilldaily(context),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey, // Border color
                                          width: 1, // Border width
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(
                                              0.5), // Border color for enabled state
                                          width: 1, // Border width
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(
                                              0.7), // Border color for focused state
                                          width: 1, // Border width
                                        ),
                                      ),
                                    ),
                                  ),

                                SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  leadingIconPath: 'assets/images/currency.png',
                                  validatorFn: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                  texfieldHeight: 60.h,
                                  controller: contoller.state
                                      .registerIndividualDoctorDaily_consultation_freeCon,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  hintText: 'daily consultation free',
                                  onChanged: (value) {},
                                  onFieldSubmitted: (value) {},
                                  obscure: false,
                                  label: '',
                                  subTitle: '',
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Standard Duration: 30 - 60 Minutes',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.arrow_left,
                                          color: AppColors.appColor,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _selectedDate = DateTime(
                                                _selectedDate.year,
                                                _selectedDate.month - 1,
                                                _selectedDate.day);
                                            _selectedDayIndex =
                                                0; // Reset selection
                                          });
                                        },
                                      ),
                                      Text(
                                        DateFormat('MMMM yyyy')
                                            .format(_selectedDate),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.arrow_right,
                                          color: AppColors.appColor,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _selectedDate = DateTime(
                                                _selectedDate.year,
                                                _selectedDate.month + 1,
                                                _selectedDate.day);
                                            _selectedDayIndex =
                                                0; // Reset selection
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  height: 110,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _monthDays.length,
                                    itemBuilder: (context, index) {
                                      final monthDay = _monthDays[index];
                                      final isSelected =
                                          index == _selectedDayIndex;

                                      // Custom date formatting
                                      String formattedDate = DateFormat('dd')
                                          .format(
                                              monthDay); // Always use two digits

                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _selectedDayIndex = index;
                                            // Also update the _selectedDate to the tapped date
                                            _selectedDate = monthDay;
                                          });
                                          // Print the selected date here
                                          // print(
                                          //     'Selected Date: ${DateFormat('yyyy-MM-dd').format(monthDay)}');

                                          contoller.state.sletedDate =
                                              _selectedDayIndex.toString();
                                          print(
                                              'Selected from provider Date: ${contoller.state.sletedDate}');
                                        },
                                        child: Container(
                                          width: 65,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            gradient: isSelected
                                                ? const LinearGradient(
                                                    colors: [
                                                        AppColors.appColor1,
                                                        AppColors.appColor,
                                                      ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight)
                                                : null,
                                            border: isSelected
                                                ? Border.all(
                                                    color: Colors
                                                        .transparent) // No border for selected items
                                                : Border.all(
                                                    color: AppColors
                                                        .loginScreenTextColor
                                                        .withOpacity(0.16),
                                                    width:
                                                        1.5), // Border for unselected items
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                formattedDate,
                                                // Date with leading zero if necessary
                                                style: TextStyle(
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Colors.grey,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Text(
                                                DateFormat('EEE').format(
                                                    monthDay), // Day name
                                                style: TextStyle(
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Colors.grey,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                 TextField(
                                    controller: contoller.state
                                        .registerIndividualDoctorWeekly_dateCon,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    decoration: InputDecoration(
                                      hintText: 'Select Date',
                                      filled: true,
                                      fillColor: Colors.white,
                                      prefixIcon: IconButton(
                                        icon: Image.asset(
                                          'assets/images/calendar.png',
                                          width: 30,
                                          height: 30,
                                        ),
                                        onPressed: () =>
                                            _selectDateweek(context),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey, // Border color
                                          width: 1, // Border width
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(
                                              0.5), // Border color for enabled state
                                          width: 1, // Border width
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(
                                              0.7), // Border color for focused state
                                          width: 1, // Border width
                                        ),
                                      ),
                                    ),
                                  ),

                                SizedBox(
                                  height: 20,
                                ),
                               TextField(
                                    controller: contoller.state
                                        .registerIndividualDoctorWeekly_time_formCon,
                                    decoration: InputDecoration(
                                      hintText: ' Time From',
                                      filled: true,
                                      fillColor: Colors.white,
                                      prefixIcon: IconButton(
                                        icon: Image.asset(
                                          'assets/images/sun.png',
                                          width: 30,
                                          height: 30,
                                        ),
                                        onPressed: () =>
                                            _selectFromTimeweek(context),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey, // Border color
                                          width: 1, // Border width
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(
                                              0.5), // Border color for enabled state
                                          width: 1, // Border width
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(
                                              0.7), // Border color for focused state
                                          width: 1, // Border width
                                        ),
                                      ),
                                    ),

                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                 TextField(
                                    controller: contoller.state
                                        .registerIndividualDoctorWeekly_time_tillCon,
                                    decoration: InputDecoration(
                                      hintText: 'Time Till',
                                      filled: true,
                                      fillColor: Colors.white,
                                      prefixIcon: IconButton(
                                        icon: Image.asset(
                                          'assets/images/moon.png',
                                          width: 30,
                                          height: 30,
                                        ),
                                        onPressed: () =>
                                            _selectTimeTillweek(context),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey, // Border color
                                          width: 1, // Border width
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(
                                              0.5), // Border color for enabled state
                                          width: 1, // Border width
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(35),
                                        borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(
                                              0.7), // Border color for focused state
                                          width: 1, // Border width
                                        ),
                                      ),
                                    ),

                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  leadingIconPath: 'assets/images/currency.png',
                                  validatorFn: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                  texfieldHeight: 60.h,
                                  controller: contoller.state
                                      .registerIndividualDoctorWeeklyConsultationFreeCon,
                                  hintText: 'weekly consultation free',
                                  onChanged: (value) {},
                                  onFieldSubmitted: (value) {},
                                  obscure: false,
                                  label: '',
                                  subTitle: '',
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Standard Duration: 30 - 60 Minutes',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                // ? SizedBox(
                //     height: 90,
                //     child: ListView.builder(
                //         scrollDirection: Axis.horizontal,
                //         itemCount: 7,
                //         shrinkWrap: true,
                //         itemBuilder: (context, index) {
                //           return Padding(
                //             padding: const EdgeInsets.only(
                //                 left: 10, right: 10, bottom: 10),
                //             child: GestureDetector(
                //               onTap: () {
                //                 setState(() {
                //                   selected = index;
                //                 });
                //               },
                //               child: Container(
                //                 width: 50,
                //                 decoration: BoxDecoration(
                //                     gradient: selected == index
                //                         ? const LinearGradient(colors: [
                //                             AppColors.appColor1,
                //                             AppColors.appColor,
                //                           ])
                //                         : null,
                //                     border: Border.all(
                //                       color: AppColors.grey.withOpacity(0.50),
                //                     ),
                //                     borderRadius: BorderRadius.circular(30)),
                //                 child: Column(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   children: [
                //                     Text(
                //                       weekdaysname[index].toString()[0],
                //                       style: getBoldStyle(
                //                           color: selected == index
                //                               ? Colors.white
                //                               : AppColors.grey,
                //                           fontSize: 22),
                //                     ),
                //                     Text(
                //                       weekdaysname[index],
                //                       style: getBoldStyle(
                //                           color: selected == index
                //                               ? Colors.white
                //                               : AppColors.grey,
                //                           fontSize: 16),
                //                     )
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           );
                //         }),
                //   )
                //     : _tabController.index == 0
                //         ? CustomTextField(
                //             validatorFn: (value) {
                //               if (value!.isEmpty) {
                //                 return 'Please enter your email';
                //               }
                //               return null;
                //             },
                //             texfieldHeight: 60.h,
                //             controller: namecontroller,
                //             hintText: 'Date',
                //             onChanged: (value) {},
                //             onFieldSubmitted: (value) {},
                //             obscure: false,
                //             label: '',
                //             subTitle: '',
                //           )
                //         : Column(
                //             children: [
                //               CustomTextField(
                //                 validatorFn: (value) {
                //                   if (value!.isEmpty) {
                //                     return 'Please enter your email';
                //                   }
                //                   return null;
                //                 },
                //                 texfieldHeight: 60.h,
                //                 controller: namecontroller,
                //                 hintText: 'Date From',
                //                 onChanged: (value) {},
                //                 onFieldSubmitted: (value) {},
                //                 obscure: false,
                //                 label: '',
                //                 subTitle: '',
                //               ),
                //               CustomTextField(
                //                 validatorFn: (value) {
                //                   if (value!.isEmpty) {
                //                     return 'Please enter your email';
                //                   }
                //                   return null;
                //                 },
                //                 texfieldHeight: 60.h,
                //                 controller: namecontroller,
                //                 hintText: 'Date Till',
                //                 onChanged: (value) {},
                //                 onFieldSubmitted: (value) {},
                //                 obscure: false,
                //                 label: '',
                //                 subTitle: '',
                //               )
                //             ],
                //           ),
                // CustomTextField(
                //   validatorFn: (value) {
                //     if (value!.isEmpty) {
                //       return 'Please enter your email';
                //     }
                //     return null;
                //   },
                //   texfieldHeight: 60.h,
                //   controller: namecontroller,
                //   hintText: 'Time From',
                //   onChanged: (value) {},
                //   onFieldSubmitted: (value) {},
                //   obscure: false,
                //   label: '',
                //   subTitle: '',
                // ),
                // CustomTextField(
                //   borderRadius: 12,
                //   validatorFn: (value) {
                //     if (value!.isEmpty) {
                //       return 'Please enter your email';
                //     }
                //     return null;
                //   },
                //   texfieldHeight: 60.h,
                //   controller: namecontroller,
                //   hintText: 'Time Till',
                //   onChanged: (value) {},
                //   onFieldSubmitted: (value) {},
                //   obscure: false,
                //   label: '',
                //   subTitle: '',
                // ),
                // CustomTextField(
                //   borderRadius: 12,
                //   validatorFn: (value) {
                //     if (value!.isEmpty) {
                //       return 'Please enter your email';
                //     }
                //     return null;
                //   },
                //   texfieldHeight: 60.h,
                //   controller: namecontroller,
                //   hintText: 'Consultation Fees',
                //   onChanged: (value) {},
                //   onFieldSubmitted: (value) {},
                //   obscure: false,
                //   label: '',
                //   subTitle: '',
                // ),
                // padding10,
                // Padding(
                //   padding: const EdgeInsets.all(0.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         'Standard Duration: 30 - 60 Minutes',
                //         style: getSemiBoldStyle(
                //             color: AppColors.grey, fontSize: MyFonts.size14),
                //       ),
                //],
                //   ),
                //   ),
                padding10,
                InkWell(
                  onTap: () {
                    // contoller.doctorIndRegister(context);

                    if (widget.onPressed != null) {
                      widget.onPressed!();
                    }
                  },
                  child: SessionButton(
                    // onPressed: () {
                    //   on
                    // },
                    back: widget.onPressedback,
                    text: 'Next',
                    isbackbuton: true,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List weekdaysname = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  int selected = 0;
}
