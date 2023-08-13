import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:omar_mostafa/apis/apis.dart';
import 'package:omar_mostafa/helpers/colors.dart';
import 'package:omar_mostafa/helpers/shared_data.dart';
import 'package:omar_mostafa/screens/home/attendance_tab/months_screen.dart';

class AttendanceTab extends StatefulWidget {
  @override
  State<AttendanceTab> createState() => _AttendanceTabState();
}

class _AttendanceTabState extends State<AttendanceTab> {
  int attendance = 0;

  @override
  void initState() {
    super.initState();
    _getFieldValue();
  }

  Future<void> _getFieldValue() async {
    var documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(APIs.user.uid)
        .get();
    var data = documentSnapshot.data();
    if (data!['is_student'] == true)
      setState(() {
        if (DateTime.now().month == 1)
          attendance = data['jan_1'] +
              data['jan_2'] +
              data['jan_3'] +
              data['jan_4'] +
              data['jan_5'] +
              data['jan_6'] +
              data['jan_7'] +
              data['jan_8'] +
              data['jan_9'] +
              data['jan_10'] +
              data['jan_11'] +
              data['jan_12'];
        else if (DateTime.now().month == 2)
          attendance = data['feb_1'] +
              data['feb_2'] +
              data['feb_3'] +
              data['feb_4'] +
              data['feb_5'] +
              data['feb_6'] +
              data['feb_7'] +
              data['feb_8'] +
              data['feb_9'] +
              data['feb_10'] +
              data['feb_11'] +
              data['feb_12'];
        else if (DateTime.now().month == 3)
          attendance = data['mar_1'] +
              data['mar_2'] +
              data['mar_3'] +
              data['mar_4'] +
              data['mar_5'] +
              data['mar_6'] +
              data['mar_7'] +
              data['mar_8'] +
              data['mar_9'] +
              data['mar_10'] +
              data['mar_11'] +
              data['mar_12'];
        else if (DateTime.now().month == 4)
          attendance = data['apr_1'] +
              data['apr_2'] +
              data['apr_3'] +
              data['apr_4'] +
              data['apr_5'] +
              data['apr_6'] +
              data['apr_7'] +
              data['apr_8'] +
              data['apr_9'] +
              data['apr_10'] +
              data['apr_11'] +
              data['apr_12'];
        else if (DateTime.now().month == 5)
          attendance = data['may_1'] +
              data['may_2'] +
              data['may_3'] +
              data['may_4'] +
              data['may_5'] +
              data['may_6'] +
              data['may_7'] +
              data['may_8'] +
              data['may_9'] +
              data['may_10'] +
              data['may_11'] +
              data['may_12'];
        else if (DateTime.now().month == 6)
          attendance = data['jun_1'] +
              data['jun_2'] +
              data['jun_3'] +
              data['jun_4'] +
              data['jun_5'] +
              data['jun_6'] +
              data['jun_7'] +
              data['jun_8'] +
              data['jun_9'] +
              data['jun_10'] +
              data['jun_11'] +
              data['jun_12'];
        else if (DateTime.now().month == 7)
          attendance = data['jul_1'] +
              data['jul_2'] +
              data['jul_3'] +
              data['jul_4'] +
              data['jul_5'] +
              data['jul_6'] +
              data['jul_7'] +
              data['jul_8'] +
              data['jul_9'] +
              data['jul_10'] +
              data['jul_11'] +
              data['jul_12'];
        else if (DateTime.now().month == 8)
          attendance = data['aug_1'] +
              data['aug_2'] +
              data['aug_3'] +
              data['aug_4'] +
              data['aug_5'] +
              data['aug_6'] +
              data['aug_7'] +
              data['aug_8'] +
              data['aug_9'] +
              data['aug_10'] +
              data['aug_11'] +
              data['aug_12'];
        else if (DateTime.now().month == 9)
          attendance = data['sep_1'] +
              data['sep_2'] +
              data['sep_3'] +
              data['sep_4'] +
              data['sep_5'] +
              data['sep_6'] +
              data['sep_7'] +
              data['sep_8'] +
              data['sep_9'] +
              data['sep_10'] +
              data['sep_11'] +
              data['sep_12'];
        else if (DateTime.now().month == 10)
          attendance = data['oct_1'] +
              data['oct_2'] +
              data['oct_3'] +
              data['oct_4'] +
              data['oct_5'] +
              data['oct_6'] +
              data['oct_7'] +
              data['oct_8'] +
              data['oct_9'] +
              data['oct_10'] +
              data['oct_11'] +
              data['oct_12'];
        else if (DateTime.now().month == 11)
          attendance = data['nov_1'] +
              data['nov_2'] +
              data['nov_3'] +
              data['nov_4'] +
              data['nov_5'] +
              data['nov_6'] +
              data['nov_7'] +
              data['nov_8'] +
              data['nov_9'] +
              data['nov_10'] +
              data['nov_11'] +
              data['nov_12'];
        else if (DateTime.now().month == 12)
          attendance = data['dec_1'] +
              data['dec_2'] +
              data['dec_3'] +
              data['dec_4'] +
              data['dec_5'] +
              data['dec_6'] +
              data['dec_7'] +
              data['dec_8'] +
              data['dec_9'] +
              data['dec_10'] +
              data['dec_11'] +
              data['dec_12'];
      });
    else {
      var documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(data['student_id'])
          .get();
      var newData = documentSnapshot.data();
      setState(() {
        if (DateTime.now().month == 1)
          attendance = newData!['jan_1'] +
              newData['jan_2'] +
              newData['jan_3'] +
              newData['jan_4'] +
              newData['jan_5'] +
              newData['jan_6'] +
              newData['jan_7'] +
              newData['jan_8'] +
              newData['jan_9'] +
              newData['jan_10'] +
              newData['jan_11'] +
              newData['jan_12'];
        else if (DateTime.now().month == 2)
          attendance = data['feb_1'] +
              newData!['feb_2'] +
              newData['feb_3'] +
              newData['feb_4'] +
              newData['feb_5'] +
              newData['feb_6'] +
              newData['feb_7'] +
              newData['feb_8'] +
              newData['feb_9'] +
              newData['feb_10'] +
              newData['feb_11'] +
              newData['feb_12'];
        else if (DateTime.now().month == 3)
          attendance = data['mar_1'] +
              newData!['mar_2'] +
              newData['mar_3'] +
              newData['mar_4'] +
              newData['mar_5'] +
              newData['mar_6'] +
              newData['mar_7'] +
              newData['mar_8'] +
              newData['mar_9'] +
              newData['mar_10'] +
              newData['mar_11'] +
              newData['mar_12'];
        else if (DateTime.now().month == 4)
          attendance = data['apr_1'] +
              newData!['apr_2'] +
              newData['apr_3'] +
              newData['apr_4'] +
              newData['apr_5'] +
              newData['apr_6'] +
              newData['apr_7'] +
              newData['apr_8'] +
              newData['apr_9'] +
              newData['apr_10'] +
              newData['apr_11'] +
              newData['apr_12'];
        else if (DateTime.now().month == 5)
          attendance = data['may_1'] +
              newData!['may_2'] +
              newData['may_3'] +
              newData['may_4'] +
              newData['may_5'] +
              newData['may_6'] +
              newData['may_7'] +
              newData['may_8'] +
              newData['may_9'] +
              newData['may_10'] +
              newData['may_11'] +
              newData['may_12'];
        else if (DateTime.now().month == 6)
          attendance = data['jun_1'] +
              newData!['jun_2'] +
              newData['jun_3'] +
              newData['jun_4'] +
              newData['jun_5'] +
              newData['jun_6'] +
              newData['jun_7'] +
              newData['jun_8'] +
              newData['jun_9'] +
              newData['jun_10'] +
              newData['jun_11'] +
              newData['jun_12'];
        else if (DateTime.now().month == 7)
          attendance = data['jul_1'] +
              newData!['jul_2'] +
              newData['jul_3'] +
              newData['jul_4'] +
              newData['jul_5'] +
              newData['jul_6'] +
              newData['jul_7'] +
              newData['jul_8'] +
              newData['jul_9'] +
              newData['jul_10'] +
              newData['jul_11'] +
              newData['jul_12'];
        else if (DateTime.now().month == 8)
          attendance = data['aug_1'] +
              newData!['aug_2'] +
              newData['aug_3'] +
              newData['aug_4'] +
              newData['aug_5'] +
              newData['aug_6'] +
              newData['aug_7'] +
              newData['aug_8'] +
              newData['aug_9'] +
              newData['aug_10'] +
              newData['aug_11'] +
              newData['aug_12'];
        else if (DateTime.now().month == 9)
          attendance = data['sep_1'] +
              newData!['sep_2'] +
              newData['sep_3'] +
              newData['sep_4'] +
              newData['sep_5'] +
              newData['sep_6'] +
              newData['sep_7'] +
              newData['sep_8'] +
              newData['sep_9'] +
              newData['sep_10'] +
              newData['sep_11'] +
              newData['sep_12'];
        else if (DateTime.now().month == 10)
          attendance = data['oct_1'] +
              newData!['oct_2'] +
              newData['oct_3'] +
              newData['oct_4'] +
              newData['oct_5'] +
              newData['oct_6'] +
              newData['oct_7'] +
              newData['oct_8'] +
              newData['oct_9'] +
              newData['oct_10'] +
              newData['oct_11'] +
              newData['oct_12'];
        else if (DateTime.now().month == 11)
          attendance = data['nov_1'] +
              newData!['nov_2'] +
              newData['nov_3'] +
              newData['nov_4'] +
              newData['nov_5'] +
              newData['nov_6'] +
              newData['nov_7'] +
              newData['nov_8'] +
              newData['nov_9'] +
              newData['nov_10'] +
              newData['nov_11'] +
              newData['nov_12'];
        else if (DateTime.now().month == 12)
          attendance = data['dec_1'] +
              newData!['dec_2'] +
              newData['dec_3'] +
              newData['dec_4'] +
              newData['dec_5'] +
              newData['dec_6'] +
              newData['dec_7'] +
              newData['dec_8'] +
              newData['dec_9'] +
              newData['dec_10'] +
              newData['dec_11'] +
              newData['dec_12'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height;
    return omar
        ? Padding(
            padding: EdgeInsets.only(
                top: height * .121, left: width * .07, right: width * .07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الحضور',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                      fontSize: width * .05),
                ),
                SizedBox(
                  height: height * .05,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => MonthsScreen(1)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(width * .07),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(width * .05)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_left_outlined,
                          color: Colors.grey,
                        ),
                        Text(
                          'الصف الأول',
                          style: TextStyle(
                              fontFamily: 'Cairo', fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .045,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => MonthsScreen(2)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(width * .07),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(width * .05)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_left_outlined,
                          color: Colors.grey,
                        ),
                        Text(
                          'الصف الثاني',
                          style: TextStyle(
                              fontFamily: 'Cairo', fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .045,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => MonthsScreen(3)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(width * .07),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(width * .05)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_left_outlined,
                          color: Colors.grey,
                        ),
                        Text(
                          'الصف الثالث',
                          style: TextStyle(
                              fontFamily: 'Cairo', fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
                top: height * .121, left: width * .07, right: width * .07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الحضور',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                      fontSize: width * .05),
                ),
                SizedBox(
                  height: height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'شهر ${DateTime.now().month}',
                      style:
                          TextStyle(fontFamily: 'cairo', fontSize: width * .05),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'عدد مرات الحضور',
                          style: TextStyle(
                              fontFamily: 'Cairo', color: Colors.grey),
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
                        Text(
                          attendance.toString(),
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                              fontSize: width * .07),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(width * .07)),
                      width: width * .75,
                      height: height * .25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'نسبة حضورك هي',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'cairo',
                                fontWeight: FontWeight.bold,
                                fontSize: width * .05),
                          ),
                          Container(
                            padding: EdgeInsets.all(width * .05),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(width * .03),
                                border: Border.all(
                                    width: width * .001, color: Colors.white)),
                            child: Text(
                              '${((attendance / 12) * 100).toStringAsFixed(2)} %',
                              style: TextStyle(
                                  fontFamily: 'cairo', color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}